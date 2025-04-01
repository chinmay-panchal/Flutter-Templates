import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms_tutorials/Screen/DataSubmitScreen/custom_validators.dart';

class Formprovider with ChangeNotifier {
  bool open = false;
  void seePassword() {
    open = !open;
    notifyListeners();
  }

  void makeImageNull() {
    _image = null;
    notifyListeners();
  }

  final firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String? _imageUrl;

  get forms => form;
  File? get image => _image;
  String? get imageUrl => _imageUrl;

  /// Define the Reactive Form with Image as Required
  static final form = FormGroup({
    'name': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(3),
        NameValidator(),
      ],
    ),
    'email': FormControl<String>(
      validators: [
        Validators.required,
        Validators.email,
        EmailCustomValidator()
      ],
    ),
    'password': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(6),
        PasswordValidator(),
      ],
    ),
    'image': FormControl<String>(
      validators: [
        Validators.required,
        ImageValidator(),
      ], // Image is required
    ),
  });

  // / Pick an image from Gallery or Camera
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      // _image = File(pickedFile.path);

      final croppedFile =
          await ImageCropper().cropImage(sourcePath: pickedFile.path ?? '');

      _image = File(croppedFile?.path ?? '');
      // form.control('image').value = pickedFile.path; // Store image path in form
      form.control('image').value = _image?.path;

      notifyListeners();
    }
  }

  Future<void> getFile() async {
    var status = await Permission.mediaLibrary.status;
    if (status.isDenied) {
      status = await Permission.mediaLibrary.request();
    }
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, withData: true);

    if (result != null) {
      File files = File(result.files.single.path ?? '');

      final croppedFile = await ImageCropper().cropImage(
        sourcePath: files.path ?? '',
      );

      _image = File(croppedFile?.path ?? '');
      form.control('image').value = _image?.path;
      notifyListeners();
    }
  }

  /// Upload Image to Firebase Storage
  Future<void> uploadImage() async {
    try {
      if (_image == null) return;

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      await storageRef.putFile(_image!);
      _imageUrl = await storageRef.getDownloadURL();
    } catch (e) {
      print("####error is here: ${e}");
    }

    notifyListeners();
  }

  /// Submit Form Data with Image URL
  Future<void> submitForm() async {
    if (!form.valid) return;

    final nameValue = form.value['name'];
    final emailValue = form.value['email'];
    final passValue = form.value['password'];

    // Upload image before saving to Firestore
    await uploadImage();

    await firestore.collection('UserDataCollection').add({
      'Name': nameValue,
      'Email': emailValue,
      'Password': passValue,
      'ImageURL': _imageUrl,
    });

    print("successful");

    form.reset();
    resetImage();
  }

  // / Reset Image
  void resetImage() {
    _image = null;
    _imageUrl = null;
    form.control('image').reset(); // Reset the image field in the form
    notifyListeners();
  }
}
