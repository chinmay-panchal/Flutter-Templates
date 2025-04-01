import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapi/provider/cubeProvider.dart';
import 'package:taskapi/screens/cubescreen/levelscreen.dart';

class Cubescreen extends StatelessWidget {
  const Cubescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Cubeprovider()),
        ],
        builder: (context, child) {
          context.read<Cubeprovider>().fetchCube();
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<Cubeprovider>(builder: (_, provider, child) {
                  if (provider.cubesModelData?.cubes?.isNotEmpty ?? false) {
                    return Expanded(
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: provider.cubesModelData?.cubes?.length,
                          itemBuilder: (ctx, index) {
                            return ListView.builder(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: provider.cubesModelData
                                    ?.cubes?[index].dimensions?.length,
                                itemBuilder: (ct, ind) {
                                  return ListView.builder(
                                      physics: ClampingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: provider
                                          .cubesModelData
                                          ?.cubes?[index]
                                          .dimensions?[ind]
                                          .hierarchies
                                          ?.length,
                                      itemBuilder: (c, i) {
                                        return Container(
                                          height: 50,
                                          child: ListTile(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Levelscreen(array: provider.cubesModelData?.cubes?[index].dimensions?[ind].hierarchies?[i].levels,)));
                                            },
                                            leading: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  shape: BoxShape.circle),
                                            ),
                                            title: Text(provider
                                                    .cubesModelData
                                                    ?.cubes?[index]
                                                    .dimensions?[ind]
                                                    .hierarchies?[i]
                                                    .name ??
                                                ''),
                                            subtitle: Text(provider
                                                    .cubesModelData
                                                    ?.cubes?[index]
                                                    .dimensions?[ind]
                                                    .hierarchies?[i]
                                                    .allMemberName ??
                                                ''),
                                          ),
                                        );
                                      });
                                });
                          }),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
              ],
            ),
          );
        });
  }
}
