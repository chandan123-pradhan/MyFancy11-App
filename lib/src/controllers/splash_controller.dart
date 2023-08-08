import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cricket_fantacy/src/dialogs/AlertDialog.dart';
import 'package:cricket_fantacy/src/dialogs/loadingDialog.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/models/GetContestListApiResponse.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/models/PlayersModel.dart';
import 'package:cricket_fantacy/src/models/get_leaderboard_api_response.dart';
import 'package:cricket_fantacy/src/models/get_my_mateches_api_response.dart';
import 'package:cricket_fantacy/src/models/get_squad_api_response.dart';
import 'package:cricket_fantacy/src/models/get_wallet_api_response.dart';
import 'package:cricket_fantacy/src/models/get_winning_info_api_response.dart';
import 'package:cricket_fantacy/src/models/splahs_api_response.dart';
import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/auth_landing_page.dart';
import 'package:cricket_fantacy/src/ui/screens/dashboard_screen.dart';
import 'package:cricket_fantacy/src/utils/app_constant.dart';
import 'package:cricket_fantacy/src/utils/local_storage/shared_prefrences.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/join_contest_confirmation_screen.dart';

class HomeController extends GetxController {
  ApiProvider apiProvider = ApiProvider();
  SharedPref sharedPref = new SharedPref();
  String profilePicUrl = 'https://www.computerhope.com/jargon/g/guest-user.png';
  late SplashDataApiResponse splashDataApiResponse;
  String userToken = '';
  GetMatchesApiResponse? getMatchesApiResponse;
  GetContestListApiResponse? getContestListApiResponse;
  GetWinningInfoApiResponse? getWinningInfoApiResponse;
  GetLeaderboardApiResponse? getLeaderboardApiResponse;
  GetSquadApiResponse? getSquadApiResponse;
  GetWalletApiResponse? getWalletApiResponse;
  GetMyMatchesApiResponse? getUpcommingMyMatchResponse;
  GetMyMatchesApiResponse? getLatestMyMatchResponse;
  GetMyMatchesApiResponse? getLiveMyMatchReponse;
  GetMyMatchesApiResponse? getCompletedMyMatchResponse;
  List<SquadPlayer> batsManList = [];
  List<SquadPlayer> wiketKeeperList = [];
  List<SquadPlayer> allRounderList = [];
  List<SquadPlayer> bowlerlist = [];
  List<SquadPlayer> choosedPlayerList = [];
  List<SquadPlayer> team1ChoosedPlayers = [];
  List<SquadPlayer> team2ChoosedPlayers = [];
  List<SquadPlayer> choosedBatsManList = [];
  List<SquadPlayer> choosedWiketKeeperList = [];
  List<SquadPlayer> choosedAllRounderList = [];
  List<SquadPlayer> choosedBowlerlist = [];

  List<int> dummyBatsManList = [];
  List<int> dummywiketKeeperList = [];
  List<int> dummyallRounderList = [];
  List<int> dummybowlerlist = [];
  SquadPlayer? choosedCaptainId;
  SquadPlayer? choosedViceCaptainId;

  String mySavedTeamId = '';

  void getSplashData(context, flag) async {
    String? userToken = await sharedPref.getUserToken();
    sharedPref.getLoginStatus();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String modelName = '';
    if (Platform.isAndroid) {
      AndroidDeviceInfo mName = await deviceInfo.androidInfo;
      modelName = mName.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      modelName = iosInfo.model;
    }
    Map parameter = {
      NetworkConstant.Package_Name: AppConstant.packageName,
      NetworkConstant.USER_TOKEN: userToken.toString(),
      NetworkConstant.Device_Name: modelName,
      NetworkConstant.One_Signal: 'ssss'
    };
    var response = await apiProvider.postBeforeAuthStaticToken(
        routeUrl: NetworkConstant.CUSTOMER_DATE_ROUTE_URL,
        bodyParams: parameter);
    // debugger();
    print(response);
    splashDataApiResponse = SplashDataApiResponse.fromJson(response);
    sharedPref.setAppToken(splashDataApiResponse.data.appToken);
    update();
    if (flag != 0) {
      _navigateFromThisPage(context, splashDataApiResponse.islogin);
    }
  }

  void _navigateFromThisPage(BuildContext context, bool islogin) async {
    getMyMatch(context, 'fixture').then((value) {
      if (islogin == true) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return DashboardScreen(
            index: 0,
          );
        }), (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return DashboardScreen(
            index: 0,
          );
        }), (route) => false);
      }
    });
  }

  void getUsersProfile() async {
    String? picUrl = await sharedPref.getProfilePic();
    // String? token = await sharedPref.getUserToken();
    if (picUrl != null) {
      profilePicUrl = picUrl;
    }
    update();
  }

  void getMatchesApiCall(context) async {
    Map parameter = {
      NetworkConstant.Status: 'Fixture',
    };
    var response = await apiProvider.postBeforeAuth(
        routeUrl: NetworkConstant.GET_MATCHES, bodyParams: parameter);
   // debugger();
    // print(response);
    getMatchesApiResponse = GetMatchesApiResponse.fromJson(response);
    update();
  }

  void getContestList(context, matchId) async {
    Map parameter = {
      NetworkConstant.MatchId: matchId,
    };
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.GET_CONTEST, bodyParams: parameter);
    print(response);
    getContestListApiResponse = GetContestListApiResponse.fromJson(response);

    update();
  }

  void getWinningInfo(context, contestId) async {
    Map parameter = {
      NetworkConstant.ContestId: contestId,
    };
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.GET_WINNING_INFO, bodyParams: parameter);
    print(response);
    getWinningInfoApiResponse = GetWinningInfoApiResponse.fromJson(response);

    update();
  }

  void getLeaderBoardResponse(context, contestId) async {
    Map parameter = {
      NetworkConstant.ContestId: contestId,
    };
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.GET_LEADERBOARD_URL, bodyParams: parameter);
    print(response);
    getLeaderboardApiResponse = GetLeaderboardApiResponse.fromJson(response);
// debugger();
    update();
  }

  void getSquad(context, matchId) async {
    Map parameter = {
      NetworkConstant.MatchId: matchId,
      NetworkConstant.Designationid: '0',
      NetworkConstant.MyTeam: '0',
      NetworkConstant.MyTeamId: '0'
    };
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.Get_Squad, bodyParams: parameter);

    getSquadApiResponse = GetSquadApiResponse.fromJson(response);

    devidePlayersAccordingToTitle();
    update();
  }

  void devidePlayersAccordingToTitle() {
    batsManList.clear();
    allRounderList.clear();
    wiketKeeperList.clear();
    bowlerlist.clear();

    dummyBatsManList.clear();
    dummyallRounderList.clear();
    dummywiketKeeperList.clear();
    dummybowlerlist.clear();

    choosedBatsManList.clear();
    choosedAllRounderList.clear();
    choosedWiketKeeperList.clear();
    choosedBowlerlist.clear();

    team1ChoosedPlayers.clear();
    team2ChoosedPlayers.clear();
    choosedPlayerList.clear();

    update();

    for (int i = 0; i < getSquadApiResponse!.data.length; i++) {
      switch (getSquadApiResponse!.data[i].playerDesigination) {
        case AppConstant.wicketKeeper:
          wiketKeeperList.add(getSquadApiResponse!.data[i]);
          dummywiketKeeperList.add(0);
          break;
        case AppConstant.batsMan:
          batsManList.add(getSquadApiResponse!.data[i]);
          dummyBatsManList.add(0);
          break;
        case AppConstant.bowler:
          bowlerlist.add(getSquadApiResponse!.data[i]);
          dummybowlerlist.add(0);
          break;
        case AppConstant.allRownder:
          allRounderList.add(getSquadApiResponse!.data[i]);
          dummyallRounderList.add(0);
          break;
        default:
          break;
      }
    }
    update();
  }

  void chosedPlayer(
      SquadPlayer player, index, String team1Id, String team2Id, context) {
    if (player.teamid == team1Id && team1ChoosedPlayers.length >= 10) {
      Messages().showErrorMsg(
          context: context,
          message: 'You can only select Maximum 10 plyer from one team.');
    } else if (player.teamid == team2Id && team2ChoosedPlayers.length >= 10) {
      Messages().showErrorMsg(
          context: context,
          message: 'You can only select Maximum 10 plyer from one team.');
    } else {
      switch (player.playerDesigination) {
        case AppConstant.wicketKeeper:
          dummywiketKeeperList[index] = 1;
          choosedWiketKeeperList.add(player);

          break;
        case AppConstant.batsMan:
          dummyBatsManList[index] = 1;
          choosedBatsManList.add(player);
          break;
        case AppConstant.bowler:
          dummybowlerlist[index] = 1;
          choosedBowlerlist.add(player);
          break;
        case AppConstant.allRownder:
          dummyallRounderList[index] = 1;
          choosedAllRounderList.add(player);
          break;
        default:
          break;
      }
      choosedPlayerList.add(player);
      devideTeam(team1Id, team2Id, player, 1);
    }

    update();
  }

  void devideTeam(String team1Id, String team2Id, SquadPlayer player, flag) {
    if (flag == 1) {
      //for add.
      if (player.teamid == team1Id) {
        team1ChoosedPlayers.add(player);
      } else if (player.teamid == team2Id) {
        team2ChoosedPlayers.add(player);
      }
    } else {
      if (player.teamid == team1Id) {
        team1ChoosedPlayers.remove(player);
      } else if (player.teamid == team2Id) {
        team2ChoosedPlayers.remove(player);
      }
    }
    update();
  }

  void removeChosedPlayer(
      SquadPlayer player, index, String team1Id, String team2Id) {
    switch (player.playerDesigination) {
      case AppConstant.wicketKeeper:
        dummywiketKeeperList[index] = 0;
        choosedWiketKeeperList.remove(index);
        break;
      case AppConstant.batsMan:
        dummyBatsManList[index] = 0;
        choosedBatsManList.remove(index);
        break;
      case AppConstant.bowler:
        dummybowlerlist[index] = 0;
        choosedBowlerlist.remove(index);
        break;
      case AppConstant.allRownder:
        dummyallRounderList[index] = 0;
        choosedAllRounderList.remove(index);
        break;
      default:
        break;
    }
    choosedPlayerList.remove(player);
    print(choosedPlayerList.length);
    devideTeam(team1Id, team2Id, player, 0);
    update();
  }

  void choosedCaption(SquadPlayer player) {
    choosedCaptainId = player;
    update();
  }

  void choosedViceCaptin(SquadPlayer player) {
    choosedViceCaptainId = player;
    update();
  }

  void saveTeam(
      {required Matches maches, required Contest contest, context}) async {
    List<Map> selectedPlayer = [];
    showLoaderDialog(context);

    try {
      for (int i = 0; i < choosedPlayerList.length; i++) {
        selectedPlayer.add({NetworkConstant.PlayerId: choosedPlayerList[i].id});
      }

      Map parameter = {
        NetworkConstant.MatchId: maches.matchId.toString(),
        NetworkConstant.MyTeamId: '0',
        NetworkConstant.List: json.encode(selectedPlayer),
        NetworkConstant.CaptainId: choosedCaptainId!.id,
        NetworkConstant.Vice_Captain_Id: choosedViceCaptainId!.id,
      };
      var response = await apiProvider.postAfterAuth(
          routeUrl: NetworkConstant.Save_Team_URL, bodyParams: parameter);
      print(response);
      Navigator.pop(context);
      if (response['status'] == 200) {
        mySavedTeamId = response['data']['id'].toString();
        Messages().showMsg(context: context, message: response['message']);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return JoinCotestConfirmationScreen(
            match: maches,
            myTeamId: mySavedTeamId,
            contest: contest,
          );
        }));
      } else {
        Messages().showMsg(context: context, message: response['message']);
      }
      update();
    } catch (e) {
      Messages().showMsg(
          context: context, message: 'Something Went Wrong, Please Try Again');
    }
  }

  void getWalletApi(context) async {
    Map parameter = {};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.Wallet_Url, bodyParams: parameter);
    print(response);
    getWalletApiResponse = GetWalletApiResponse.fromJson(response);

    update();
  }

  void joinContest({
    required context,
    required Contest contest,
  }) async {
    showLoaderDialog(context);

    Map parameter = {
      NetworkConstant.ContestId: contest.contestId.toString(),
      NetworkConstant.MyTeamId: mySavedTeamId
    };
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.Join_Contest, bodyParams: parameter);
    Navigator.pop(context);
    debugger(); //

    if (response == null) {
      Messages().showErrorMsg(
          context: context, message: 'Match created successfully done.');
      choosedCaptainId = null;
      choosedViceCaptainId = null;
      mySavedTeamId = '';
      choosedPlayerList.clear();
      allRounderList.clear();
      batsManList.clear();
      wiketKeeperList.cast();
      bowlerlist.cast();
      dummyBatsManList.clear();
      dummyallRounderList.clear();
      dummybowlerlist.clear();
      dummywiketKeeperList.clear();

      // Get.deleteAll();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return DashboardScreen(
          index: 1,
        );
      }), (route) => false);
    } else if (response['status'] != 200) {
      showAlertDialogboxWidget(context, response['message'], () {
        choosedCaptainId = null;
        choosedViceCaptainId = null;
        // getSquadApiResponse=null;
        allRounderList.clear();
        batsManList.clear();
        wiketKeeperList.cast();
        bowlerlist.cast();
        mySavedTeamId = '';
        choosedPlayerList.clear();
        dummyBatsManList.clear();
        dummyallRounderList.clear();
        dummybowlerlist.clear();
        dummywiketKeeperList.clear();

        // Get.deleteAll();
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return DashboardScreen(
            index: 1,
          );
        }), (route) => false);
      });
      //  Messages().showErrorMsg();
    }

    update();
  }

  Future<void> getMyMatch(context, String status) async {
    if (logInStatus) {
      try {
        Map parameter = {NetworkConstant.Status: status};
        var response = await apiProvider.postAfterAuth(
            routeUrl: NetworkConstant.MyMatchList_Url, bodyParams: parameter);
        //debugger();
        print(response);
        if (status == 'fixture') {
         // debugger();
          getUpcommingMyMatchResponse =
              GetMyMatchesApiResponse.fromJson(response);
        } else if (status == 'latest') {
        //  debugger();
          print(response);
          getLatestMyMatchResponse = GetMyMatchesApiResponse.fromJson(response);
        } else if (status == 'live') {
          getLiveMyMatchReponse = GetMyMatchesApiResponse.fromJson(response);
        } else if (status == 'completed') {
          getCompletedMyMatchResponse =
              GetMyMatchesApiResponse.fromJson(response);
        }

        update();
      } catch (e) {
        update();
      }
    }
  }
}
