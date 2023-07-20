import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  String userToken = 'token';
  String appToken = 'appToken';
  String profilePicUrl='profile_pic';
  String authToken='authToken';
  String name='name';
  String email='email';
  String phone='phone';
  Future<String?> getUserToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? uToken = preferences.getString(userToken);
    return uToken;
  }

  Future<String?> getAppToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? aToken = preferences.getString(appToken);
    return aToken;
  }

  void setUserToken(token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(userToken, token);
  }

  void setAppToken(token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    
    preferences.setString(appToken, token);
    saveAuthToken();
  }

Future<String?> getProfilePic() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? pic = preferences.getString(profilePicUrl);
    
    return pic;
  }

  void setProfilepic(profilePic) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(profilePicUrl, profilePic);
  }


  void logout()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(profilePicUrl);
    preferences.remove(userToken);
  }
  void saveAuthToken()async{
   SharedPreferences preferences = await SharedPreferences.getInstance(); 
   String? userToken=await getUserToken();
   String? appToken=await getAppToken();
   preferences.setString(authToken, appToken!+'.'+userToken!);
  }

  Future<String?>getAuthToken()async{
SharedPreferences preferences = await SharedPreferences.getInstance(); 
return preferences.getString(authToken);
  }




  

}
