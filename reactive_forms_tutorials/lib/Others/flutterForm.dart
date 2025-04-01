
import 'package:flutter/material.dart';

class FlutterFormExample extends StatefulWidget {
  const FlutterFormExample({super.key});

  @override
  createState() => _FlutterFormExampleState();
}

class _FlutterFormExampleState extends State<FlutterFormExample> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Form Example'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: Column(
            children: <Widget>[
              TextFormField(
                key: const Key("nickname"),
                decoration: const InputDecoration(
                  label: Text('Nickname'),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 4),
              TextFormField(
                key: const Key("email"),
                decoration: const InputDecoration(
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 4),
              TextFormField(
                key: const Key("comment"),
                decoration: const InputDecoration(
                  label: Text('Comment'),
                  prefixIcon: Icon(Icons.textsms),
                ),
                minLines: 5,
                maxLines: 5,
              ),
              const SizedBox(height: 4),
              FormField<bool>(
                  initialValue: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  builder: (field) => CheckboxListTile(
                    key: const Key('radio'),
                    title: const Text('Accept terms and conditions'),
                    dense: field.hasError,
                    onChanged: field.didChange,
                    value: field.value,
                  ),
                ),
              const SizedBox(height: 4),
              ElevatedButton(
                key: const Key('submit'),
                onPressed: () {},
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}