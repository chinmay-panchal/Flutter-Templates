import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static const String _uidKey = 'user_uid';

  Future<void> saveUid(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_uidKey, uid);
  }

  Future<String?> getUid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_uidKey);
  }

  Future<void> clearUid() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_uidKey);
  }
}