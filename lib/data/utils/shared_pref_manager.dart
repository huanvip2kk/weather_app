import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;
  String boolKey = "boolKey";
  String stringKey = "stringKey";

  init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  setBoolToSF({required bool metric}) async {
    await _sharedPrefs!.setBool(
      boolKey,
      metric,
    );
  }

  setStringToSF({required String lang}) async {
    await _sharedPrefs!.setString(
      stringKey,
      lang,
    );
  }

  String? get lang => _sharedPrefs!.getString(stringKey);

  bool? get metric => _sharedPrefs!.getBool(boolKey);
}

final sharedPrefs = SharedPrefs();
