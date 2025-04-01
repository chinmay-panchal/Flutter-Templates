import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SimpleReactiveForm extends StatelessWidget {
  SimpleReactiveForm({super.key});

  // Create a form with two fields: 'name' and 'termsAccepted'
  final FormGroup form = FormGroup({
    'name': FormControl<String>(
      validators: [Validators.required, Validators.minLength(3)],
    ),
    'termsAccepted': FormControl<bool>(validators: [Validators.requiredTrue]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple Reactive Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ReactiveForm(
          formGroup: form, // Link the form to the UI
          child: Column(
            children: [
              // Name Input Field
              ReactiveTextField<String>(
                formControlName: 'name',
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validationMessages: {
                  ValidationMessage.required: (error) => 'Name is required',
                  ValidationMessage.minLength: (error) => 'At least 3 characters',
                },
              ),
              const SizedBox(height: 16),

              // Terms and Conditions Checkbox
              ReactiveCheckboxListTile(
                formControlName: 'termsAccepted',
                title: const Text("I accept the terms and conditions"),
              ),
              const SizedBox(height: 16),

              // Submit Button (Enabled only if the form is valid)
              ReactiveFormConsumer(
                builder: (context, form, child) {
                  return ElevatedButton(
                    onPressed: form.valid
                        ? () {
                            // Show form values in a snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Submitted: ${form.value}'),
                                backgroundColor: Colors.greenAccent,
                              ),
                            );
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
    );
  }
}