import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:london_yard/View/HomeScreen/Widget/DeliveryWidget.dart';
import 'package:london_yard/View/HomeScreen/Widget/PickUpWidget.dart';
import 'package:london_yard/View/HomeScreen/Widget/drawerCommonWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 0;

  var def = Colors.black;
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  List<String> dropDownValues = [
    'Prahladnagar Store',
    'Ahmedabad',
    'Gandhinager',
    'Rajkot',
    'Surat',
  ];

  final List<String> img = [
    "assets/images/banner1_london_yard.jpeg",
    "assets/images/grid1_london_yard.png",
    "assets/images/grid2_london_yard.png",
    "assets/images/grid3_london_yard.png",
    "assets/images/grid4_london_yard.png"
  ];

  String? selectedItem = 'Prahladnagar Store';
  bool open = false;

  @override
  Widget build(BuildContext context) {
    // selectedItem = dropDownValues.first;
    ExpandedTileController expandedTileController =
        ExpandedTileController(isExpanded: true);

    return Scaffold(
      key: key,
      drawer: Drawer(
          shape: Border.all(width: 1.0, color: Colors.white),
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(top: 22.0, right: 9.0, left: 9.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/logo_london_yard.jpeg"),
                      minRadius: 30,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vishesh Patel",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              "+9999999999",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "EDIT",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.settings),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  // width: double.infinity,
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    children: [
                      ListTileTheme(
                          contentPadding: const EdgeInsets.all(0),
                          dense: true,
                          horizontalTitleGap: 0,
                          minLeadingWidth: 0,
                          minVerticalPadding: 0,
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              onExpansionChanged: (value) {
                                open = value;
                                print(open);
                                setState(() {});
                              },
                              trailing: open
                                  ? const Icon(Icons.arrow_drop_down_outlined)
                                  : const Icon(Icons.arrow_right_rounded),
                              title: const Text(
                                "About",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: const Text("hy in expansion")),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: const Text("hy in expansion")),
                              ],
                            ),
                          )),
                      const Drawercommonwidget(
                          title: "My account",
                          subtitle: "Addresses, Payments, Referals, etc,"),
                      const Drawercommonwidget(
                          title: "Past orders",
                          subtitle: "See record of past orders"),
                      const Drawercommonwidget(
                          title: "Past bill payments",
                          subtitle: "See record of past bill payments"),
                      const Drawercommonwidget(
                          title: "Help", subtitle: "FAQs & Links"),
                    ],
                  ),
                ),
              ],
            ),
          )),
      endDrawer: const Drawer(
        backgroundColor: Colors.blue,
        child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/logo_london_yard.jpeg")),
      ),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            if (!(key.currentState?.isDrawerOpen ?? false)) {
              key.currentState?.openDrawer();
              setState(() {});
            }
          },
          child: const CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/logo_london_yard.jpeg")),
        ),
        title: const Text(
          "London Yard Pizza",
          style:
              TextStyle(fontSize: 32, color: Color.fromARGB(255, 8, 64, 160)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (!(key.currentState?.isEndDrawerOpen ?? false)) {
                  key.currentState?.openEndDrawer();
                  setState(() {});
                }
              },
              icon: const Icon(
                Icons.account_circle,
                size: 40,
              )),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Ahmedabad'),
                SizedBox(
                  height: 20,
                  child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(5),
                      value: selectedItem,
                      items: dropDownValues
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )))
                          .toList(),
                      onChanged: (item) => setState(() {
                            selectedItem = item;
                          })),
                ),
                const SizedBox(
                  height: 20,
                ),
                TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(
                        text: "DELIVERY",
                      ),
                      Tab(
                        text: "PICKUP",
                      ),
                      Tab(
                        text: "DINE IN",
                      ),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TabBarView(children: [
                    DeliveryWidget(img: img),
                    const Pickupwidget(),
                    Container()
                  ]),
                ),

                // Container(
                //   height: 250,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       image: DecorationImage(
                //           image: AssetImage(
                //               "assets/images/banner1_london_yard.jpeg"),
                //           fit: BoxFit.cover)),
                // ),
              ],
            ),
          );
        }),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     currentIndex: i,
      //     selectedItemColor: Colors.red,
      //     type: BottomNavigationBarType.fixed,
      //     onTap: (index) {
      //       print(index);
      //       setState(() {
      //         i = index;
      //       });
      //     },
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.home,
      //             // color: Colors.black,
      //           ),
      //           label: "Home",
      //           backgroundColor: Colors.grey[400]),
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.home,
      //             // color: Colors.black,
      //           ),
      //           label: "Offers",
      //           backgroundColor: Colors.grey[400]),
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.home,
      //             // color: Colors.black,
      //           ),
      //           label: "Loyalty",
      //           backgroundColor: Colors.grey[400]),
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.home,
      //             // color: Colors.black,
      //           ),
      //           label: "Cart",
      //           backgroundColor: Colors.grey[400]),
      //     ])
    );
  }
}
