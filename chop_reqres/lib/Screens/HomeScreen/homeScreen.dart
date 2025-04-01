import 'package:chop_reqres/Network/appChopperClient.dart';
import 'package:chop_reqres/Providers/homeprovider.dart';
import 'package:chop_reqres/Utils/dataService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DataService dataService =
        DataService.create(ChopperClientInstance.client);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Homeprovider(dataService)),
        ],
        builder: (context, child) {
          context.read<Homeprovider>().fetchData();
          return Scaffold(
              body: Column(
            children: [
              Expanded(
                child: Consumer<Homeprovider>(
                  builder: (context, value, child) => ListView.builder(
                      itemCount: value.userdata?.length ?? 0,
                      itemBuilder: (ctx, index) {
                        return Text(
                            value.userdata?[index].firstName ?? '') ;
                      }),
                ),
              )
            ],
          ));
        });
  }
}
