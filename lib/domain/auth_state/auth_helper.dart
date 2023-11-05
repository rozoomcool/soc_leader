import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStateHelper {
  static const String isLoggedInKey = 'isLoggedIn';

  static Future<void> setLoggedIn(bool value) async {
    final SharedPreferences prefs = GetIt.I<SharedPreferences>();
    await prefs.setBool(isLoggedInKey, value);
  }

  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = GetIt.I<SharedPreferences>();
    return prefs.getBool(isLoggedInKey) ?? false;
  }
}
