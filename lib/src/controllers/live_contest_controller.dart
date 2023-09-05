import 'dart:async';
import 'dart:developer';

import 'package:cricket_fantacy/src/models/LiveMatchUpdateApiResponse.dart';
import 'package:cricket_fantacy/src/models/get_my_team_api_response.dart';
import 'package:cricket_fantacy/src/models/get_my_team_api_response.dart';
import 'package:cricket_fantacy/src/models/my_contest_api_response.dart';
import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:get/get.dart';

class LiveContestController extends GetxController {
  var liveMatchUpdateApiResponse;

  MyContestApiResponse? myContestApiResponse;
  GetMyTeamApiResponse? getMyTeamApiResponse;

  Timer? timer;

  ApiProvider apiProvider = ApiProvider();
  getData(matchId) async {
    // Timer.periodic(Duration(seconds: 5), (timer)async {
    Map parameter = {NetworkConstant.MatchId: matchId};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.Match_by_id, bodyParams: parameter);
    // debugger();
    liveMatchUpdateApiResponse = response;
    print("score udpated");
    update();
    getMyContest(matchId);
    upatedScroe(matchId);
    //  });
  }

  void upatedScroe(matchId) async {
    Timer.periodic(Duration(seconds: 5), (timer) async {
      Map parameter = {NetworkConstant.MatchId: matchId};
      var response = await apiProvider.postAfterAuth(
          routeUrl: NetworkConstant.Match_by_id, bodyParams: parameter);
      // debugger();
      liveMatchUpdateApiResponse = response;
      print("score udpated");
      update();
    });
  }

  void getMyContest(matchId) async {
    Map parameter = {NetworkConstant.MatchId: matchId};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.My_Contest, bodyParams: parameter);
    // debugger();
    myContestApiResponse = MyContestApiResponse.fromJson(response);
    print("my contest data featched");
    update();
    getMyTeam(matchId);
  }


  void getMyTeam(matchId) async {
    Map parameter = {NetworkConstant.MatchId: matchId};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.My_Team, bodyParams: parameter);
    // debugger();
    getMyTeamApiResponse = GetMyTeamApiResponse.fromJson(response);
    print("my team data featched");
    update();
  }


}
