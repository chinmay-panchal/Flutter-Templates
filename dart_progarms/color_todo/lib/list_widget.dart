import 'package:color_todo/home_screen.dart';
import 'package:color_todo/todo_item.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
final  List<TodoItem> item;
  const ListWidget({super.key, required this.item, });

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.item.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                           widget. item[index].title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.item[index].subtitle),
                          Text("priority: ${widget.item[index].status.name}"),
                        ],
                      ),
                    );
                  });
            },
            child: Container(
              margin: const EdgeInsets.only(top: 6, bottom: 6),
              padding: const EdgeInsets.only(left: 6.0),
              // height: 40,
              decoration: BoxDecoration(
                color: items[index].status.color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index].title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(items[index].subtitle),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    // height: 40,
                    decoration: (BoxDecoration(
                        color: items[index].status.color,
                        borderRadius: BorderRadius.circular(4))),
                    child: Text(items[index].status.title),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
