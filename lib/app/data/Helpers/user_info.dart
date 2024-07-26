import 'package:shared_preferences/shared_preferences.dart';

const String TOKEN = 'token';

const String USER_ID = 'userID';

const String TYPE_ACCOUNT = 'type_account';

class UserInfo {
  Future setToken(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(TOKEN, value);
  }

  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(TOKEN);
  }

  Future setUserID(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(USER_ID, value);
  }

  Future<String?> getUserID() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(USER_ID).toString();
  }

  Future setTypeAccount(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.setString(TYPE_ACCOUNT, value);
  }

  Future<String?>getTypeAccount() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(TYPE_ACCOUNT).toString();
  }

  Future<void> logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
