import 'package:shared_preferences/shared_preferences.dart';

class shared_pref_method{
  static String userId="USERKEY";
  static String UserNameKey="USERNAMEKEY";
  static String UserEmailKey="USEREMAILKEY";
  static String UserwalletKey="USERWALLETKEY";
  static String UserProfileKey="USERPROFILEKEY";
  Future<bool> saveUserId(String getUserId)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.setString(userId, getUserId);
  }
  Future<bool> saveUserName(String getUserName)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.setString(UserNameKey, getUserName);
  }
  Future<bool> saveUserEmail(String getUserEmail)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.setString(UserEmailKey, getUserEmail);
  }
  Future<bool> saveUserWallet(String getUserWallet)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.setString(UserwalletKey, getUserWallet);
  }
  Future<bool> saveUserProflie(String getUserProfile)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.setString(UserProfileKey, getUserProfile);
  }
  Future<String?> getUserid()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString(userId);
  }
  Future<String?> getUserName()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString(UserNameKey);
  }
  Future<String?> getUserEmail()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString(UserEmailKey);
  }
  Future<String?> getUserWallet()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString(UserwalletKey);
  }
  Future<String?> getUserProfile()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString(UserProfileKey);
  }
}