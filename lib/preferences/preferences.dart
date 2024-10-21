import 'package:shared_preferences/shared_preferences.dart';

mixin Preferences {
  Future setWalkThrough() async {
    var pref = await SharedPreferences.getInstance();
    pref.setBool(Keys.WALK_THROUGH.toString(), false);
  }

  Future<bool> isWalkThrough() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getBool(Keys.WALK_THROUGH.toString()) ?? true;
  }

  Future setToken(String token) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(Keys.TOKEN.toString(), token);
  }

  Future<String> getToken() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getString(Keys.TOKEN.toString()) ?? '';
  }

  Future removeToken() async {
    var pref = await SharedPreferences.getInstance();
    pref.remove(Keys.TOKEN.toString());
  }
}

enum Keys {
  WALK_THROUGH,
  TOKEN,
}
