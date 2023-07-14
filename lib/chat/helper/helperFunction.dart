import 'package:shared_preferences/shared_preferences.dart';

class helperFunctions{

  //keys
  static String userLoggedInkey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String emailKey = "EMAILKEY";


  //saving the data to SF
static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async{
  SharedPreferences sf = await SharedPreferences.getInstance();
  return await sf.setBool(userLoggedInkey, isUserLoggedIn);
}
  static Future<bool> saveUserNameSF(String userName) async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }
  static Future<bool> saveUserEmailSF(String email) async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(emailKey, emailKey);
  }

  // get data from SF

static Future<bool?> getUserLoggedInStatus() async{
  SharedPreferences sf = await SharedPreferences.getInstance();
  return sf.getBool(userLoggedInkey);
}


}