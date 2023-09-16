import 'dart:async';
import 'dart:developer';

import 'package:cricket_fantacy/src/models/LiveMatchUpdateApiResponse.dart';
import 'package:cricket_fantacy/src/models/get_my_player_api_response.dart';
import 'package:cricket_fantacy/src/models/get_my_team_api_response.dart';
import 'package:cricket_fantacy/src/models/get_my_team_api_response.dart';
import 'package:cricket_fantacy/src/models/my_contest_api_response.dart';
import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveContestController extends GetxController {
  var liveMatchUpdateApiResponse;
  Timer? _timer;
  MyContestApiResponse? myContestApiResponse;
  GetMyTeamApiResponse? getMyTeamApiResponse;
  GetMyPlayerApiResponse? getMyPlayerApiResponse;

  List<MyPlayerData> batsmanData = [];
  List<MyPlayerData> bowlerList = [];
  List<MyPlayerData> wicketKeeperList = [];
  List<MyPlayerData> allrounderList = [];

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
    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
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

  void closeTimer(context) {
    _timer!.cancel();
    liveMatchUpdateApiResponse = null;
    Navigator.pop(context);
    update();
  }

  void getTeamPlayers(teamId) async {
    Map parameter = {'team_id': teamId};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.getMyPlayers, bodyParams: parameter);

    getMyPlayerApiResponse = GetMyPlayerApiResponse.fromJson(response);
    calculatePlayerByDesignation();
    //update();
  }

  void calculatePlayerByDesignation() {
    batsmanData.clear();
    bowlerList.clear();
    allrounderList.clear();
    wicketKeeperList.clear();
    for (int i = 0; i < getMyPlayerApiResponse!.data.length; i++) {
      switch (getMyPlayerApiResponse!.data[i].designationid) {
        case '1':
          batsmanData.add(getMyPlayerApiResponse!.data[i]);
          break;
        case '2':
          bowlerList.add(getMyPlayerApiResponse!.data[i]);
          break;
        case '3':
          allrounderList.add(getMyPlayerApiResponse!.data[i]);
          break;
        case '4':
          wicketKeeperList.add(getMyPlayerApiResponse!.data[i]);
      }

    }
    update();
  }
}
