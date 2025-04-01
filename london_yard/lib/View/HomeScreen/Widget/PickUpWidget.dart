import 'package:flutter/material.dart';

class Pickupwidget extends StatelessWidget {
  const Pickupwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              child: const Row(children: [
            Icon(Icons.search),
            Expanded(
                child: TextField(
                    decoration: InputDecoration(hintText: "Search Your Food"))),
            Icon(Icons.display_settings),
          ])),
          SizedBox(
            height: 20,
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.yellow,
                    Colors.orangeAccent,
                    Colors.yellow.shade300,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Classic Fast",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "Food",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text("\$5.29", style: TextStyle(fontSize: 25)),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text("Order"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white)),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/grid2_london_yard.png"),
                    minRadius: 100,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
