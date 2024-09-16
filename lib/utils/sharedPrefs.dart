import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

  static Future<void> setPrefs() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> setUuid(String uuid) async {
    await _sharedPrefs!.setString('uuid', uuid);
  }

  static String? getUuid() {
    return _sharedPrefs?.getString('uuid');
  }
}
