import 'package:flutter/material.dart';
import 'package:new_fire/Provider/firestore_service.dart';
import 'package:new_fire/Utility/enum.dart';

class Try2 extends StatelessWidget {
  Try2({super.key});
  
  final FirestoreService firestoreService = FirestoreService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form Key
  final TextEditingController _taskController = TextEditingController();
  Priority selectedPriority = Priority.Low;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            actions: [
              Form(
                key: _formKey, // Assign form key
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Prevents overflow
                  children: [
                    TextFormField(
                      controller: _taskController,
                      decoration: const InputDecoration(hintText: "Enter task name"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Task name cannot be empty";
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<Priority>(
                      value: selectedPriority,
                      items: Priority.values.map((priority) {
                        return DropdownMenuItem(
                          value: priority,
                          child: Text(priority.title),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          selectedPriority = value;
                        }
                      },
                      decoration: const InputDecoration(labelText: "Select Priority"),
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, proceed with the action
                      firestoreService.addTask(_taskController.text, selectedPriority);
                      Navigator.pop(context); // Close the dialog
                    }
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}