import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../data/helpers/app_preferences.dart';


class SplashController extends StateNotifier<String> {
  final AppPreferences _prefs;

  SplashController(super.initialState, {AppPreferences? prefs}) : _prefs = prefs ?? AppPreferences();

  Future<String> init() async {
    const key = 'prueba';

    try {
      final rc = FirebaseRemoteConfig.instance;

      await rc.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 0),
      ));


      await rc.setDefaults(<String, dynamic>{
        key: 'prueba_local',
      });

      final value = rc.getString(key);

      final activated = await rc.fetchAndActivate();

      final v = rc.getValue('prueba');
      print('activated=$activated');
      print('value="${v.asString()}" source=${v.source}');
      print('allKeys=${rc.getAll().keys.toList()}');

      await _prefs.saveStartupText(value);


      return value;
    } catch (_) {
      return await _prefs.getStartupText();
    }
  }
}
