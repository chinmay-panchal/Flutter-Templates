// Custom Validator for Name (Min length 3)
import 'package:reactive_forms/reactive_forms.dart';

class NameValidator extends Validator<String> {
  const NameValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<String> control) {
    if (control.value == null || control.value!.isEmpty) {
      return {'nameRequired': true}; // Custom error key
    }
    if (control.value!.length < 3) {
      return {'nameTooShort': true}; // Custom error key
    }
    return null; // Valid name
  }
}

// Custom Validator for Email (Email format check)
class EmailCustomValidator extends Validator<String> {
  const EmailCustomValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<String> control) {
    final emailPattern =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (control.value == null || control.value!.isEmpty) {
      return {'emailRequired': true}; // Custom error key
    }
    if (!emailPattern.hasMatch(control.value!)) {
      return {'emailInvalid': true}; // Custom error key
    }
    return null; // Valid email
  }
}

// Custom Validator for Password (Min length 6)
class PasswordValidator extends Validator<String> {
  const PasswordValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<String> control) {
    if (control.value == null || control.value!.isEmpty) {
      return {'passwordRequired': true}; // Custom error key
    }
    if (control.value!.length < 6) {
      return {'passwordTooShort': true}; // Custom error key
    }

    if (!RegExp(r'[A-Z]').hasMatch(control.value!)) {
      return {'Password must contain at least one uppercase letter': true};
    }

    if (!RegExp(r'[a-z]').hasMatch(control.value!)) {
      return {'Password must contain at least one lowercase letter': true};
    }

    if (!RegExp(r'[0-9]').hasMatch(control.value!)) {
      return {'Password must contain at least one number': true};
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(control.value!)) {
      return {'Password must contain at least one special character': true};
    }
    return null; // Valid password
  }
}

// Custom Validator for Image (Required)
class ImageValidator extends Validator<String> {
  const ImageValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<String> control) {
    if (control.value == null || control.value!.isEmpty) {
      return {'imageRequired': true}; // Custom error key
    }
    return null; // Valid image
  }
}
