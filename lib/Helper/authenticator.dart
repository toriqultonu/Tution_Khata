import 'package:shared_preferences/shared_preferences.dart';

Future<void> setToken(tokenValue) async{
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString("token", tokenValue);
}

 getToken() async{
  final SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token');

}