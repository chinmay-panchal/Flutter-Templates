import 'package:fire_ui/dashboard.dart';
import 'package:fire_ui/models/Priority.dart';
import 'package:fire_ui/models/todo_item.dart';
import 'package:flutter/material.dart';

class ContainerClass extends StatelessWidget {
  final String t;
  ContainerClass(this.index, this.items, {super.key, required this.t});

  int index;
  List<TodoItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: items[index].priority.color.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${t}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '${items[index].Description}',
                      style: TextStyle(fontSize: 15),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // height: MediaQuery.sizeOf(context).height,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: items[index].priority.color,
              ),
              child: Text(
                items[index].priority.title ?? Priority.Low.title,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
