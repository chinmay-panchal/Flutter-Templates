import 'package:chop/Network/appChopperClient.dart';
import 'package:chop/Providers/musicProvider.dart';
import 'package:chop/utils/music_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MusicService musicService =
        MusicService.create(ChopperClientInstance.client);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MusicProvider(musicService)),
        ],
        builder: (context, child) {
          final provider = context.read<MusicProvider>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: provider.emailcontroller,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                    ),
                  ),
                  TextField(
                    controller: provider.passcontroller,
                    decoration: InputDecoration(hintText: "Enter Password"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    // onTap: () => signIn(context),
                    onTap: () async {
                      await provider.login(context);
                    },
                    child: Container(
                      color: Colors.amber,
                      height: 40,
                      child: Center(
                        child: Text("Login"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

// Future<void> SignIn() async {
  //   try {
  //     final response = await musicService.login({
  //       "login_id": _emailcontroller.text,
  //       "login_password": _passcontroller.text,
  //       "fcm_id": "fcm",
  //       "device_type": Platform.isAndroid ? "Android" : "IOS"
  //     });

  //     if (response.isSuccessful) {
  //       print("successful");
  //     } else {
  //       print("error");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> signIn(BuildContext context) async {
  //   final musicProvider = context.read<MusicProvider>();

  //   bool success = await musicProvider.login(
  //     _emailcontroller.text,
  //     _passcontroller.text,
  //   );

  //   if (success) {
  //     print("here is your id: ${context.read<MusicProvider>().id}");
  //     final a = context.read<MusicProvider>().id;
  //     print("Login Successful");
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => Datascreen(id: a)),
      // );
  //   } else {
  //     print("Login Failed");
  //   }
  // }

  // Future<void> fetchData() async {
  //   try {
  //     final response = await musicService.getMusicData();

  //     if (!response.isSuccessful) {
  //       throw Exception("Failed to fetch data: ${response.statusCode}");
  //     }

  //     SongDataModel? data = response.body;
  //     print("Data: ${data?.message ?? ''}");
  //   } catch (e) {
  //     print(e);
  //   }
  // }