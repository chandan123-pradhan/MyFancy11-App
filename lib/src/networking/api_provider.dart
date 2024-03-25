import 'dart:convert';
import 'dart:developer';

import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:cricket_fantacy/src/utils/app_constant.dart';
import 'package:cricket_fantacy/src/utils/local_storage/shared_prefrences.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<dynamic> getBeforeAuth({required String routeUrl}) async {
    var response =
        await http.get(Uri.parse(NetworkConstant.BASE_URL + routeUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {}
  }

  Future<dynamic> getAfterAuth({required String routeUrl}) async {
    String token = '';
    var response = await http.get(
        Uri.parse(NetworkConstant.BASE_URL + routeUrl),
        headers: {'Autherization': 'Bearer $token'});
        debugger();
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {}
  }

   Future<dynamic> getMethod({required String routeUrl}) async {
    String token = '';
    var response = await http.get(
        Uri.parse(NetworkConstant.BASE_URL + routeUrl),
        headers: {'Autherization': 'Bearer $token'});
        debugger();
    if (response.statusCode == 200) {
      try{
          return json.decode(response.body);
      }catch(e){
return "";
      }
    } else {}
  }

  Future<dynamic> postBeforeAuthStaticToken(
      {required String routeUrl, required Map bodyParams}) async {
    try {

      // debugger();
      var response = await http.post(
          Uri.parse(NetworkConstant.BASE_URL + routeUrl),
          headers: {'Token': AppConstant.staticToken},
          body: bodyParams);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {}
    } catch (e) {
      debugger();
      print(e);
    }
  }

  Future<dynamic> postBeforeAuthWithAppToken(
      {required String routeUrl, required Map bodyParams}) async {
    try {
      isUnAuthenicated=false;
      SharedPref sharedPref = SharedPref();
      String? appToken = await sharedPref.getAppToken();
      var response = await http.post(
          Uri.parse(NetworkConstant.BASE_URL + routeUrl),
          headers: {'Token': appToken!},
          body: bodyParams);
       //debugger();
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 400) {
        isUnAuthenicated=true;
        return json.decode(response.body);
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }


  Future<dynamic> postAfterAuth(
      {required String routeUrl, required Map bodyParams}) async {
    try {
      isUnAuthenicated=false;
      SharedPref sharedPref = SharedPref();
      String? appToken = await sharedPref.getAuthToken();
     //debugger();
    print(appToken);
      var response = await http.post(
          Uri.parse(NetworkConstant.BASE_URL + routeUrl),
          headers: {'Token': appToken!},
          body: bodyParams);
//  debugger();
     print(response);
      if (response.statusCode == 200|| response.statusCode==404) {
        // debugger();
        return json.decode(response.body);
      } else if (response.statusCode == 400) {
        isUnAuthenicated=true;
        return json.decode(response.body);
      }if (response.statusCode == 500) {
        return json.decode(response.body);
      }  
      else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }


  Future<dynamic> postAfterAuthCustom(
      {required String routeUrl, required Map bodyParams}) async {
    try {
      isUnAuthenicated=false;
      SharedPref sharedPref = SharedPref();
      String? appToken = await sharedPref.getAuthToken();
  //   debugger();
    print(appToken);
      var response = await http.post(
          Uri.parse(NetworkConstant.BASE_URL + routeUrl),
          headers: {'Token': appToken!},
          body: bodyParams);
    // debugger();
    //  print(response);
      if (response.statusCode == 200|| response.statusCode==404 || response.statusCode==300) {
        return json.decode(response.body);
      } else if (response.statusCode == 400) {
        isUnAuthenicated=true;
        return json.decode(response.body);
      }if (response.statusCode == 500) {
        return json.decode(response.body);
      }  
      else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> postBeforeAuth(
      {required String routeUrl, required Map bodyParams}) async {
    try {
      isUnAuthenicated=false;
      SharedPref sharedPref = SharedPref();
      String? appToken = await sharedPref.getAppToken();
      // debugger();
        print(appToken);
      var response = await http.post(
          Uri.parse(NetworkConstant.BASE_URL + routeUrl),
          headers: {'Token': appToken??''},
          body: bodyParams);
      // debugger();
      if (response.statusCode == 200) {
        //debugger();
        return json.decode(response.body);
      } else if (response.statusCode == 400) {
        isUnAuthenicated=true;
        return json.decode(response.body);
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  
}
