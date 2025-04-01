import 'package:flutter/material.dart';
import 'package:reactive_forms_tutorials/Others/flutterForm.dart';
import 'package:reactive_forms_tutorials/Screen/DataSubmitScreen/dataSubmitScreen.dart';
import 'package:reactive_forms_tutorials/Others/reactiveForm.dart';
import 'package:reactive_forms_tutorials/Others/simpleReativeForm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            key: const Key('flutter_example'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => const FlutterFormExample(),
                ),
              );
            },
            child: const Text('Flutter Form example'),
          ),
          ElevatedButton(
            key: const Key('reactive_example'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) =>  Datasubmitform(),
                ),
              );
            },
            child: const Text('Reactive Form example'),
          ),
        ],
      ),
    );
  }
}
