import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const _kRemoteText = 'rc_startup_text';

  Future<void> saveStartupText(String value) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_kRemoteText, value);
  }

  Future<String> getStartupText() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(_kRemoteText) ?? '';
  }
}
