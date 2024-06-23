import 'package:shared_preferences/shared_preferences.dart';

class GlobalLocalRepo {
  late Future<SharedPreferences> prefs;

  GlobalLocalRepo(){
    prefs =  SharedPreferences.getInstance();
  }

  saveToken(String token,String refreshToken) async {
    SharedPreferences pref = await prefs;
    pref.setString('token', token);
    pref.setString('refesh_token',refreshToken);
  }

  Future<String ?> getToken()async{
    SharedPreferences pref = await prefs;
    pref.getString('token');
  }

  deleteAllSaved() async{
    SharedPreferences pref = await prefs;
    pref.clear();

  }


}