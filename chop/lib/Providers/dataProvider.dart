import 'package:chop/Models/songDataModel.dart';
import 'package:chop/utils/music_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dataprovider extends ChangeNotifier {
  final MusicService _musicService;

  SongDataModel? musicData;
  // late int? id;
  // bool _isLoading = false;

  Dataprovider(this._musicService);

  // SongDataModel? get musicData => _musicData;
  // bool get isLoading => _isLoading;

  // shared preference not used:
  // Future<void> fetchMusicData({required int ?id}) async {
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

  Future<void> fetchMusicData() async {
    // _isLoading = true;
    // notifyListeners();

    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int? id = _prefs.getInt('id');

    try {
      final queryMap = {
        'user_id': id,
        'limit': 30,
        'filter': 'FlowActivoPlaylist',
        'recordtype': 'Tracks',
        'flowactivoplaylist_id': 4,
        'page': 1,
      };
      final response = await _musicService.getMusicData(queryMap);

      if (response.isSuccessful) {
        print("data fetch successful");
        musicData = response.body;
      }
    } catch (e) {
      print("Error fetching music data: $e");
    }

    // _isLoading = false;
    notifyListeners();
  }
}
