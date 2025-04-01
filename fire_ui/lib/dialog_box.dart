import 'package:fire_ui/dashboard.dart';
import 'package:fire_ui/models/Priority.dart';
import 'package:fire_ui/models/todo_item.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController disController;
  Priority? selectedPriority;
  final Function(Priority? value)? onSave;
  final Function(Priority value)? onUpdate;
  final Function()? onDelete;
  final Function()? onDone;
  int? Index;

  DialogBox(
      {super.key,
      required this.titleController,
      required this.disController,
      this.selectedPriority,
      this.onDone,
      this.onSave,
      this.onUpdate,
      this.onDelete,
      this.Index});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      // insetPadding: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: 'enter title'),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: disController,
              decoration: InputDecoration(hintText: 'Enter Description'),
            ),
            SizedBox(
              height: 15,
            ),
            DropdownButtonFormField(
              value: selectedPriority,
              items:
                  // Priority.values.map((priority) {
                  //   return DropdownMenuItem(
                  //     value: priority,
                  //     child: Text(priority.title),
                  //   );
                  // }).toList(),
                  Priority.values.where((priority) {
                if (onDone != null) {
                  return true; // Show all priorities when onDone is passed
                }
                return priority !=
                    Priority.Done; // Hide "Done" when onDone is not passed
              }).map((priority) {
                return DropdownMenuItem(
                  value: priority,
                  child: Text(priority.title),
                );
              }).toList(),
              onChanged: (value) {
                selectedPriority = value;
              },
              decoration: const InputDecoration(
                labelText: "Select Priority",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Visibility(
              visible: onSave != null,
              child: ElevatedButton(
                onPressed: () {
                  if (onSave != null) {
                    onSave!(selectedPriority);
                  }
                },
                child: const Text("Add"),
              ),
              replacement: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (onUpdate != null) {
                          onUpdate!(selectedPriority!);
                        }
                        Navigator.pop(context);
                      },
                      child: Text('Update')),
                  ElevatedButton(
                      onPressed: () {
                        if (onDelete != null) {
                          onDelete!();
                        }
                        Navigator.pop(context);
                      },
                      child: Text('Delete')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
