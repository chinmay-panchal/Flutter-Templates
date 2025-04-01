// import 'package:chop/Models/songDataModel.dart';
import 'package:chop/Screens/DataScreen/dataScreen.dart';
import 'package:chop/utils/music_service.dart';
// import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MusicProvider extends ChangeNotifier {
  final MusicService _musicService;
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  // SongDataModel? musicData;
  late int? id;
  // bool _isLoading = false;

  MusicProvider(this._musicService);

  // SongDataModel? get musicData => _musicData;
  // bool get isLoading => _isLoading;

  // Future<void> fetchMusicData() async {
  //   // _isLoading = true;
  //   // notifyListeners();

  //   try {
  //     final queryMap = {
  //       'user_id': id,
  //       'limit': 30,
  //       'filter': 'FlowActivoPlaylist',
  //       'recordtype': 'Tracks',
  //       'flowactivoplaylist_id': 4,
  //       'page': 1,
  //     };
  //     final response = await _musicService.getMusicData(queryMap);

  //     if (response.isSuccessful) {
  //       print("data fetch successful");
  //       musicData = response.body;
  //     }
  //   } catch (e) {
  //     print("Error fetching music data: $e");
  //   }

  //   // _isLoading = false;
  //   notifyListeners();
  // }

  // sharedpreference not used
  // Future<void> login(BuildContext context) async {
  //   print("hello");
  //   try {
  //     print("hyyyy");

  //     final response = await _musicService.login({
  //       "login_id": emailcontroller.text,
  //       "login_password": passcontroller.text,
  //       "fcm_id": "fcm",
  //       "device_type": "Android"
  //     });

  //     print("Byyyy");

  //     if (response.isSuccessful) {
  //       print("successful");
  //       // id = response.body?.userId;
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (_) => Datascreen(
  //                     id: response.body?.userId,
  //                   )));
  //     } else {
  //       print("failure");
  //     }
  //     notifyListeners();

  //     // return response.isSuccessful;
  //   } catch (e) {
  //     print("Login Error: $e");
  //     // return false;
  //   }
  // }

  Future<void> login(BuildContext context) async {
    print("hello");
    try {
      print("hyyyy");

      final response = await _musicService.login({
        "login_id": emailcontroller.text,
        "login_password": passcontroller.text,
        "fcm_id": "fcm",
        "device_type": "Android"
      });

      print("Byyyy");

      if (response.isSuccessful) {
        print("successful");
        // id = response.body?.userId;
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setInt('id', response.body?.userId ?? -1);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => Datascreen(
                      // id: response.body?.userId,
                    )));
      } else {
        print("failure");
      }
      notifyListeners();

      // return response.isSuccessful;
    } catch (e) {
      print("Login Error: $e");
      // return false;
    }
  }
}
