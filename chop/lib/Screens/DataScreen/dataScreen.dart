import 'package:chop/Network/appChopperClient.dart';
import 'package:chop/Providers/dataProvider.dart';
import 'package:chop/utils/music_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class Datascreen extends StatelessWidget {
  // final int? id;
  // Datascreen({super.key, this.id});

  Datascreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MusicService musicService =
        MusicService.create(ChopperClientInstance.client);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Dataprovider(musicService),
          )
        ],
        builder: (context, child) {
          
          // shared preference not used:
          // context.read<Dataprovider>().fetchMusicData(id: id ?? 28);

          context.read<Dataprovider>().fetchMusicData();

          if (Platform.isWindows) {}
          return Scaffold(
              body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<Dataprovider>(builder: (context, provider, child) {
                if (provider.musicData?.data?.isNotEmpty ?? false) {
                  return Expanded(
                      child:
                          // Platform.isAndroid
                          //     ? ListView.builder(
                          //         itemCount: provider.musicData?.data?.length,
                          //         itemBuilder: (ctx, index) {
                          //           return ListTile(
                          //             title: Text(provider
                          //                     .musicData!.data?[index].songId
                          //                     .toString() ??
                          //                 ''),
                          //             subtitle: Text(provider
                          //                     .musicData?.data?[index].songName ??
                          //                 ''),
                          //           );
                          //         })
                          //     :
                          GridView.builder(
                              shrinkWrap: true,
                              scrollDirection:
                                  Platform.isAndroid || Platform.isIOS
                                      ? Axis.vertical
                                      : Axis.horizontal,
                              itemCount: provider.musicData?.data?.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          Platform.isAndroid ? 1 : 2),
                              itemBuilder: (ctx, index) {
                                return SizedBox(
                                  height: 40,
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Text(provider
                                                .musicData!.data?[index].songId
                                                .toString() ??
                                            ''),
                                        Text(provider.musicData?.data?[index]
                                                .songName ??
                                            ''),
                                      ],
                                    ),
                                  ),
                                );
                              }));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ],
          ));
        });
  }
}
