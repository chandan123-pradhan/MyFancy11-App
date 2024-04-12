// import 'dart:developer';

import 'dart:developer';

import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  String userToken = 'token';
  String appToken = 'appToken';
  String profilePicUrl='profile_pic';
  String authToken='authToken';
  String name='name';
  String email='email';
  String phone='phone';
  String isLoggedIn='isLoggedIn';
  String userId='user_id';
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
    print(token);
    preferences.setString(userToken, token);
  }





 Future<String?> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
   
    String? aToken = preferences.getString(userId);
     debugger();
    return aToken;
  }

  void setUserId(id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    debugger();
    print(id);
    preferences.setString(userId, id);
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

   void setProfileDetails(profileName,emailId,m) async {
    // debugger();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(email, emailId);
    preferences.setString(name, profileName);
    preferences.setString(phone,m);
    // debugger();
    getProfileData();
  }


  void getProfileData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userName=preferences.getString(name)!;
    userEmail=preferences.getString(email)!;
    // debugger();
    mobileNubmer=preferences.getString(phone)!;
  }

  


  void logout()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(profilePicUrl);
    preferences.remove(userToken);
    preferences.remove(isLoggedIn);
    preferences.remove(authToken);
    logInStatus=false;
    preferences.setString('profilePicUrl', 'https://www.computerhope.com/jargon/g/guest-user.png');
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



void setLoginStatus()async
{
  SharedPreferences preferences = await SharedPreferences.getInstance(); 
  preferences.setBool(isLoggedIn, true);
  logInStatus=true;
}

void getLoginStatus()async{
 SharedPreferences preferences = await SharedPreferences.getInstance(); 
bool? status= preferences.getBool(isLoggedIn);
// debugger();
print(status);
if(status==null || status==false){
  logInStatus=false;
}else{
  logInStatus=true;
  getProfileData();
}
print(logInStatus);
}

  

}
