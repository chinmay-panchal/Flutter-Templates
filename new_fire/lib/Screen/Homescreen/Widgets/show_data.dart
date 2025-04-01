import 'package:flutter/material.dart';
import 'package:new_fire/Provider/firestore_service.dart';
import 'package:new_fire/Models/taskitem.dart';
import 'package:provider/provider.dart';

class Try extends StatelessWidget {
  const Try({super.key});

  @override
  Widget build(BuildContext context) {
    List<Taskitem> tasks = Provider.of<List<Taskitem>>(context);
    final streamprovider = FirestoreService();

    return tasks.isEmpty
        ? CircularProgressIndicator()
        // ? Center(child: Text("No tasks available"))
        : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (ctx, index) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: tasks[index].priority.color.withOpacity(0.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tasks[index].name,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: tasks[index].priority.color,
                      ),
                      child: Text(
                        tasks[index].priority.title,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
