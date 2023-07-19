import 'package:shared_preferences/shared_preferences.dart';

class helperFunctions{

  //keys
  static String userLoggedInkey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String emailKey = "EMAILKEY";
  static String userTypeKey = "USERTYPEKEY";
  static String phoneNumberKey = "PHONENUMBERKEY";
  static String memberIDKey = "MEMBERIDKEY";


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
    return await sf.setString(emailKey, email);
  }
  static Future<bool> saveUserTypeSF(String userType) async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userTypeKey, userType);
  }
  static Future<bool> savePhoneNumberSF(String phoneNumber) async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(phoneNumberKey, phoneNumber);
  }
  static Future<bool> saveMemberIdSF(String memberID) async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(memberIDKey, memberID);
  }

  // get data from SF

static Future<bool?> getUserLoggedInStatus() async{
  SharedPreferences sf = await SharedPreferences.getInstance();
  return sf.getBool(userLoggedInkey);
}
  static Future<String?> getUserEmailFromSF() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(emailKey);
  }

  static Future<String?> getUserNameFromSF() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }
  static Future<bool?> getUserTypeFromSF() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userTypeKey);
  }
  static Future<String?> getPhoneNumberFromSF() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(phoneNumberKey);
  }

  static Future<String?> getMemberIdFromSF() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(memberIDKey);
  }

}