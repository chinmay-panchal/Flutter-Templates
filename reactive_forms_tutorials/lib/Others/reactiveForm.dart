import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveFormExample extends StatelessWidget {
  const ReactiveFormExample({super.key});

  // 📝 Step 1: Create the Form Group (Notebook 📒)
  static final form = FormGroup({
    'name': FormControl<String>(
      validators: [Validators.required, Validators.minLength(3)],
    ),
    'age': FormControl<int>(
      validators: [Validators.required, Validators.min(18)],
    ),
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'password': FormControl<String>(
      validators: [Validators.required, Validators.minLength(6)],
    ),
    'dob': FormControl<DateTime>(
      validators: [Validators.required],
    ),
    'gender': FormControl<String>(
      validators: [Validators.required],
    ),
    'subscription': FormControl<bool>(value: false), // Switch
    'termsAccepted': FormControl<bool>(
      validators: [Validators.requiredTrue],
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Input Types in Reactive Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ReactiveForm(
          formGroup: form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 📝 Name (Text Field)
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

                ReactiveTextField<String>(
                  formControlName: 'email',
                  decoration: const InputDecoration(labelText: 'Email'),
                  validationMessages: {
                    ValidationMessage.required: (error) => 'Email is required',
                    ValidationMessage.email: (error) => 'Invalid email format',
                  },
                ),

                const SizedBox(height: 10),

                ReactiveTextField<String>(
                  formControlName: 'password',
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validationMessages: {
                    ValidationMessage.required: (error) =>
                        'Password is required',
                    ValidationMessage.minLength: (error) =>
                        'Must be at least 6 characters',
                  },
                ),

                const SizedBox(height: 10),

                ReactiveTextField<int>(
                  formControlName: 'age',
                  decoration: const InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validationMessages: {
                    ValidationMessage.required: (error) => 'Age is required',
                    ValidationMessage.min: (error) => 'Age must be at least 18',
                  },
                ),

                const SizedBox(height: 10),

                // 📅 Date of Birth (Date Picker)
                ReactiveDatePicker<DateTime>(
                  formControlName: 'dob',
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  builder: (context, picker, child) {
                    return ElevatedButton(
                      onPressed: picker.showPicker,
                      child: Text(
                        picker.value == null
                            ? 'Select Date of Birth'
                            : picker.value.toString().split(' ')[0],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 10),

                // 🚻 Gender (Radio Buttons)
                const Text('Gender'),
                ReactiveRadioListTile<String>(
                  formControlName: 'gender',
                  value: 'Male',
                  title: const Text('Male'),
                ),
                ReactiveRadioListTile<String>(
                  formControlName: 'gender',
                  value: 'Female',
                  title: const Text('Female'),
                ),
                ReactiveRadioListTile<String>(
                  formControlName: 'gender',
                  value: 'Other',
                  title: const Text('Other'),
                ),

                const SizedBox(height: 10),

                // 🔘 Subscription (Switch)
                ReactiveSwitch(
                  formControlName: 'subscription',
                  activeColor: Colors.green,
                ),
                const Text('Subscribe to newsletter'),

                const SizedBox(height: 10),

                // ✅ Terms & Conditions (Checkbox)
                ReactiveCheckboxListTile(
                  formControlName: 'termsAccepted',
                  title: const Text('I accept the terms and conditions'),
                ),

                const SizedBox(height: 10),

                // 🎯 Submit Button
                ReactiveFormConsumer(
                  builder: (context, form, child) {
                    return ElevatedButton(
                      onPressed: form.valid
                          ? () {
                              print('Form Submitted: ${form.value}');
                            }
                          : null, // Disable button if form is invalid
                      child: const Text('Submit'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// class ReactiveFormExample extends StatefulWidget {
//   const ReactiveFormExample({super.key});

//   @override
//   createState() => _ReactiveFormExampleState();
// }

// class _ReactiveFormExampleState extends State<ReactiveFormExample> {
//   final _form = FormGroup({
//     'nickname': FormControl<String>(),
//     'email': FormControl<String>(),
//     'comment': FormControl<String>(),
//     'termsAccepted': FormControl<bool>(),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reactive Form Example'),
//       ),
//       body: ReactiveForm(
//         formGroup: _form,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: 16,
//             horizontal: 24,
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 ReactiveTextField<String>(
//                   key: const Key('nickname'),
//                   formControlName: 'nickname',
//                   decoration: const InputDecoration(
//                     label: Text('Nickname'),
//                     prefixIcon: Icon(Icons.person),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 ReactiveTextField<String>(
//                   key: const Key('email'),
//                   formControlName: 'email',
//                   decoration: const InputDecoration(
//                     label: Text('Email'),
//                     prefixIcon: Icon(Icons.email),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 ReactiveTextField<String>(
//                   key: const Key('comment'),
//                   formControlName: 'comment',
//                   decoration: const InputDecoration(
//                     label: Text('Comment'),
//                     prefixIcon: Icon(Icons.textsms),
//                   ),
//                   minLines: 5,
//                   maxLines: 5,
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 ReactiveCheckboxListTile(
//                   key: const Key('termsAccepted'),
//                   formControlName: 'termsAccepted',
//                   title: const Text('Accept terms and conditions'),
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 ReactiveFormConsumer(
//                   key: const Key('submit'),
//                   builder: (context, form, _) => ElevatedButton(
//                     onPressed: () {},
//                     child: const Text('Submit'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }