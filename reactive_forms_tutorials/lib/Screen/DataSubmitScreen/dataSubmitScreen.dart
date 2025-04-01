import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_tutorials/Screen/DataSubmitScreen/formProvider.dart';
import 'package:reactive_forms_tutorials/Screen/ShowDataScreen/showDataScreen.dart';

class Datasubmitform extends StatefulWidget {
  const Datasubmitform({super.key});

  @override
  State<Datasubmitform> createState() => _DatasubmitformState();
}

class _DatasubmitformState extends State<Datasubmitform> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Formprovider()),
      ],
      builder: (context, child) => Scaffold(
        appBar: AppBar(title: const Text('Text Submit Form')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ReactiveForm(
            formGroup: context.read<Formprovider>().forms,
            child: Column(
              children: [
                // Name Field
                ReactiveTextField<String>(
                  formControlName: 'name',
                  decoration: const InputDecoration(labelText: 'Name'),
                  validationMessages: {
                    ValidationMessage.required: (error) => 'Name is required',
                    ValidationMessage.minLength: (error) =>
                        'Name must be at least 3 characters long',
                  },
                ),
                const SizedBox(height: 10),

                // Email Field
                ReactiveTextField<String>(
                  formControlName: 'email',
                  decoration: const InputDecoration(labelText: 'Email'),
                  validationMessages: {
                    ValidationMessage.required: (error) => 'Email is required',
                    ValidationMessage.email: (error) => 'Invalid email format',
                  },
                ),
                const SizedBox(height: 10),

                // Password Field
                Consumer<Formprovider>(
                  builder: (context, value, child) => ReactiveTextField<String>(
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                      icon: value.open
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () {
                        value.seePassword();
                      },
                    )),
                    formControlName: 'password',
                    obscureText: value.open ? false : true,
                    validationMessages: {
                      ValidationMessage.required: (error) =>
                          'Password is required',
                      ValidationMessage.minLength: (error) =>
                          'Must be at least 6 characters',
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Image Picker Section
                Consumer<Formprovider>(
                  builder: (context, provider, child) {
                    return Column(
                      children: [
                        provider.image != null
                            ? Container(
                                height: 150,
                                width: 150,
                                child: Stack(children: [
                                  Center(
                                    child: Image.file(provider.image!,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(
                                        onPressed: () {
                                          provider.makeImageNull();
                                        },
                                        icon: Icon(
                                          Icons.cancel_presentation_sharp,
                                          color: Colors.red,
                                        )),
                                  )
                                ]),
                              )
                            : const Text("No Image Selected",
                                style: TextStyle(color: Colors.red)),
                        Visibility(
                          visible: provider.image==null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton.icon(
                                // onPressed: () => provider.pickImage(ImageSource.gallery),
                                onPressed: () {
                                  provider.getFile();
                                },
                                icon: const Icon(Icons.image),
                                label: const Text("Gallery"),
                              ),
                              ElevatedButton.icon(
                                onPressed: () =>
                                    provider.pickImage(ImageSource.camera),
                                icon: const Icon(Icons.camera),
                                label: const Text("Camera"),
                              ),
                            ],
                          ),
                        ),

                        // Validation message if no image is selected
                        ReactiveValueListenableBuilder<String>(
                          formControlName: 'image',
                          builder: (context, control, child) {
                            return control.invalid && control.touched
                                ? const Text('Image is required',
                                    style: TextStyle(color: Colors.red))
                                : const SizedBox.shrink();
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Submit Button
                ReactiveFormConsumer(
                  builder: (context, form, child) {
                    return ElevatedButton(
                      onPressed: context.read<Formprovider>().forms.valid
                          ? () {
                              context.read<Formprovider>().submitForm();
                            }
                          : null,
                      child: const Text('Submit'),
                    );
                  },
                ),

                // Show Data Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Showdatascreen()),
                    );
                  },
                  child: const Text("Show Data"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
