import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cricket_fantacy/src/dialogs/AlertDialog.dart';
import 'package:cricket_fantacy/src/dialogs/loadingDialog.dart';
import 'package:cricket_fantacy/src/dialogs/update_dialog.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/models/GetContestListApiResponse.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/models/PlayersModel.dart';
import 'package:cricket_fantacy/src/models/check_ekyc_api_response.dart';
import 'package:cricket_fantacy/src/models/eKycRequestBody.dart';
import 'package:cricket_fantacy/src/models/get_leaderboard_api_response.dart';
import 'package:cricket_fantacy/src/models/get_my_mateches_api_response.dart';
import 'package:cricket_fantacy/src/models/get_promocode_api_response.dart';
import 'package:cricket_fantacy/src/models/get_squad_api_response.dart';
import 'package:cricket_fantacy/src/models/get_wallet_api_response.dart';
import 'package:cricket_fantacy/src/models/get_winning_info_api_response.dart';
import 'package:cricket_fantacy/src/models/my_paid_team_api_response.dart';
import 'package:cricket_fantacy/src/models/splahs_api_response.dart';
import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/auth_landing_page.dart';
import 'package:cricket_fantacy/src/ui/screens/dashboard_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/pick_player_screen.dart';
import 'package:cricket_fantacy/src/utils/app_constant.dart';
import 'package:cricket_fantacy/src/utils/local_storage/shared_prefrences.dart';
// import 'package:cricket_fantacy/src/utils/local_storage/shared_prefrences.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/join_contest_confirmation_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upi_india/upi_india.dart';

class HomeController extends GetxController {
  ApiProvider apiProvider = ApiProvider();
  SharedPref sharedPref = new SharedPref();
  String profilePicUrl = 'https://www.computerhope.com/jargon/g/guest-user.png';
  late SplashDataApiResponse splashDataApiResponse;
  String userToken = '';
  int totalCreditPoint = 100;
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
  bool isLineupPressed = false;
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
  CheckEkyApiResponse? checkEkyApiResponse;
  MyPaidTeamApiResponse? myPaidTeamApiResponse;

  String mySavedTeamId = '';
  int eKycStatus = 0;

  List<ContestList> contestList = [];

  void lineupBottonPressed() {
    isLineupPressed = true;
    update();
  }

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
    isFetchingData = true;
    Map parameter = {
      NetworkConstant.Status: 'Fixture',
    };
    var response;

    if (logInStatus) {
      response = await apiProvider.postAfterAuth(
          routeUrl: NetworkConstant.GET_MATCHES, bodyParams: parameter);
    } else {
      response = await apiProvider.postBeforeAuth(
          routeUrl: NetworkConstant.GET_MATCHES, bodyParams: parameter);
    }
    //  debugger();
    print(response);
    if (response != null) {
      getMatchesApiResponse = GetMatchesApiResponse.fromJson(response);
      // debugger();
      print(getMatchesApiResponse);
    } else {
      getMatchesApiResponse = null;
    }
    isFetchingData = false;
    getWalletApi(context);
    update();
    callUpdateDialog(context);
  }

  void getContestList(context, matchId, entry, pricePool) async {
    Map parameter = {
      NetworkConstant.MatchId: matchId,
      'entry': entry,
      'price_pool': pricePool
    };
    // debugger();
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.GET_CONTEST, bodyParams: parameter);
    print(response);

    getContestListApiResponse = GetContestListApiResponse.fromJson(response);
    //  debugger();
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
    // debugger();
    // print(response);
    getLeaderboardApiResponse = GetLeaderboardApiResponse.fromJson(response);

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
// debugger();
print("sdf");
    getSquadApiResponse = GetSquadApiResponse.fromJson(response);

    devidePlayersAccordingToTitle();
    update();
  }

  Future<void> devidePlayersAccordingToTitle() async {
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
    // totalCreditPoint=100;

    update();

    for (int i = 0; i < getSquadApiResponse!.data.length; i++) {
      switch (getSquadApiResponse!.data[i].playerDesigination) {
        case AppConstant.wicketKeeper:
          //wiketKeeperList.add(getSquadApiResponse!.data[i]);
          if (getSquadApiResponse!.data[i].isSelect == '1') {
            var v = wiketKeeperList.reversed.toList();
            v.add(getSquadApiResponse!.data[i]);
            wiketKeeperList = v.reversed.toList();
          } else {
            wiketKeeperList.add(getSquadApiResponse!.data[i]);
          }
          dummywiketKeeperList.add(0);
          break;
        case AppConstant.batsMan:
          if (getSquadApiResponse!.data[i].isSelect == '1') {
            var v = batsManList.reversed.toList();
            v.add(getSquadApiResponse!.data[i]);
            batsManList = v.reversed.toList();
          } else {
            batsManList.add(getSquadApiResponse!.data[i]);
          }
          dummyBatsManList.add(0);
          break;
        case AppConstant.bowler:
          if (getSquadApiResponse!.data[i].isSelect == '1') {
            var v = bowlerlist.reversed.toList();
            v.add(getSquadApiResponse!.data[i]);
            bowlerlist = v.reversed.toList();
          } else {
            bowlerlist.add(getSquadApiResponse!.data[i]);
          }
          //bowlerlist.add(getSquadApiResponse!.data[i]);
          dummybowlerlist.add(0);
          break;
        case AppConstant.allRownder:
          if (getSquadApiResponse!.data[i].isSelect == '1') {
            var v = allRounderList.reversed.toList();
            v.add(getSquadApiResponse!.data[i]);
            allRounderList = v.reversed.toList();
          } else {
            allRounderList.add(getSquadApiResponse!.data[i]);
          }

          dummyallRounderList.add(0);
          break;
        default:
          break;
      }
    }
    update();
  }

  void clasifyChoosedPlayer(t1Id, t2Id) {
    for (int i = 0; i < getSquadApiResponse!.data.length; i++) {
      //debugger();
      if (getSquadApiResponse!.data[i].isSelect == '1') {
        print(getSquadApiResponse!.data.length);
        //debugger();
        switch (getSquadApiResponse!.data[i].playerDesigination) {
          case AppConstant.wicketKeeper:
            choosedWiketKeeperList.add(getSquadApiResponse!.data[i]);
            dummywiketKeeperList[choosedWiketKeeperList.length - 1] = 1;
            //debugger();

            break;
          case AppConstant.batsMan:
            choosedBatsManList.add(getSquadApiResponse!.data[i]);
            dummyBatsManList[choosedBatsManList.length - 1] = 1;
            break;
          case AppConstant.bowler:
            choosedBowlerlist.add(getSquadApiResponse!.data[i]);
            dummybowlerlist[choosedBowlerlist.length - 1] = 1;
            break;
          case AppConstant.allRownder:
            choosedAllRounderList.add(getSquadApiResponse!.data[i]);
            dummyallRounderList[choosedAllRounderList.length - 1] = 1;
            break;
          default:
            break;
        }
        choosedPlayerList.add(getSquadApiResponse!.data[i]);
        devideTeam(t1Id, t2Id, getSquadApiResponse!.data[i], 1);
        // debugger();
        // print(choosedPlayerList.le);
      }
    }
    // debugger();
    print(choosedPlayerList.length);
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
      if (player.playerDesigination == AppConstant.allRownder &&
          choosedAllRounderList.length >= 8) {
        //allrounder cannot be more than 8
        Messages().showErrorMsg(
            context: context,
            message: 'You cannot choose more than 8 Allrounder.');
      } else if (player.playerDesigination == AppConstant.wicketKeeper &&
          choosedWiketKeeperList.length >= 8) {
        //weeketkeepr cannot be more than 8
        Messages().showErrorMsg(
            context: context,
            message: 'You cannot choose more than 8 Wicketkeeper.');
      } else if (player.playerDesigination == AppConstant.batsMan &&
          choosedBatsManList.length >= 8) {
        //batsman cannot be more than 8
        Messages().showErrorMsg(
            context: context,
            message: 'You cannot choose more than 8 Batsman.');
      } else if (player.playerDesigination == AppConstant.bowler &&
          choosedBowlerlist.length >= 8) {
        //bowlner cannot be more than 8
        Messages().showErrorMsg(
            context: context,
            message: 'You cannot choose more than 8 Bowlers.');
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
        totalCreditPoint = totalCreditPoint - int.parse(player.creditPoints);
        choosedPlayerList.add(player);
        devideTeam(team1Id, team2Id, player, 1);
      }

      update();
    }
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
    print(player.playerDesigination);
    switch (player.playerDesigination) {
      case AppConstant.wicketKeeper:
        dummywiketKeeperList[index] = 0;
        choosedWiketKeeperList.remove(player);
        break;
      case AppConstant.batsMan:
        dummyBatsManList[index] = 0;
        choosedBatsManList.remove(player);
        break;
      case AppConstant.bowler:
        dummybowlerlist[index] = 0;
        choosedBowlerlist.remove(player);
        break;
      case AppConstant.allRownder:
        dummyallRounderList[index] = 0;
        choosedAllRounderList.remove(player);
        break;
      default:
        break;
    }
    totalCreditPoint = totalCreditPoint + int.parse(player.creditPoints);
    try {
      //debugger();
      bool val = choosedPlayerList.remove(player);
      print("is data removed=$val");
      devideTeam(team1Id, team2Id, player, 0);
      update();
    } catch (e) {
      print(e);
    }
  }

  void choosedCaption(
    SquadPlayer player,
  ) {
    choosedCaptainId = player;
    // update();
  }

  void choosedViceCaptin(SquadPlayer player) {
    choosedViceCaptainId = player;
    // update();
  }

  void saveTeam(
      {required Matches maches,
      required Contest contest,
      context,
      required String myTeamID}) async {
    List<Map> selectedPlayer = [];
    showLoaderDialog(context);
    print(choosedPlayerList);
// debugger();
    try {
      for (int i = 0; i < choosedPlayerList.length; i++) {
        selectedPlayer
            .add({NetworkConstant.PlayerId: choosedPlayerList[i].playerid});
      }

      // debugger();

      Map parameter = {
        NetworkConstant.MatchId: maches.matchId.toString(),
        NetworkConstant.MyTeamId: myTeamID == '' ? '0' : myTeamID,
        NetworkConstant.List: json.encode(selectedPlayer),
        NetworkConstant.CaptainId: choosedCaptainId!.playerid,
        NetworkConstant.Vice_Captain_Id: choosedViceCaptainId!.playerid,
      };

      print(parameter);
      //  debugger();
      var response = await apiProvider.postAfterAuth(
          routeUrl: NetworkConstant.Save_Team_URL, bodyParams: parameter);
      // debugger();

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
      // debugger();
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
    checkKyc(context);
    getPromoCode();
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
    //  debugger(); //
    Navigator.pop(context);

    if (response['status'] == 200) {
      Messages().showErrorMsg(
          context: context, message: 'Match created successfully done.');
      choosedCaptainId = null;
      choosedViceCaptainId = null;
      mySavedTeamId = '';
      choosedPlayerList.clear();
      // totalCreditPoint=100;
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
        // totalCreditPoint=100;
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
// debugger();
        print(response);
        if (status == 'fixture') {
          // debugger();
          getUpcommingMyMatchResponse =
              GetMyMatchesApiResponse.fromJson(response);
        } else if (status == 'latest') {
          getLatestMyMatchResponse = GetMyMatchesApiResponse.fromJson(response);
        } else if (status == 'live') {
          getLiveMyMatchReponse = GetMyMatchesApiResponse.fromJson(response);
        } else if (status == 'result') {
          getCompletedMyMatchResponse =
              GetMyMatchesApiResponse.fromJson(response);
        }

        update();
      } catch (e) {
        update();
      }
    }
  }

  void recharge(
      {required context,
      required UpiResponse upiResponse,
      required String amount,
      required String mode}) async {
    showLoaderDialog(context);
    Map parameter = {
      NetworkConstant.amount: amount,
      NetworkConstant.mode: mode,
      NetworkConstant.transaction_details:
          "Transaction id= ${upiResponse.transactionId}, Transaction Ref Id=${upiResponse.transactionRefId}",
      NetworkConstant.status: 'TXN_SUCCESS',
      'promo_code': appliedPromoCode
    };
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.recharge, bodyParams: parameter);
    Navigator.pop(context);
    print(response);
    // debugger();
    getWalletApi(context);
    // getWalletApiResponse = GetWalletApiResponse.fromJson(response);

    update();
  }

  String selectedPaymentGateway = '';
  void checkKyc(context) async {
    eKycStatus = 0;
    update();
    Map parameter = {};
    var response = await apiProvider.postAfterAuthCustom(
        routeUrl: NetworkConstant.checkEkyc, bodyParams: parameter);
    // debugger();
    print(response);
    if (response['status'] == 300) {
      eKycStatus = 1;
    } else if (response['status'] == 100) {
      checkEkyApiResponse = CheckEkyApiResponse.fromJson(response);
      selectedPaymentGateway = checkEkyApiResponse!.data.isDefault;
      eKycStatus = 2;
    } else if (response['status'] == 200) {
      checkEkyApiResponse = CheckEkyApiResponse.fromJson(response);
      selectedPaymentGateway = checkEkyApiResponse!.data.isDefault;

      eKycStatus = 3;
    }

    update();
  }

  void requestEky(
      {required context, required EkycRequestBody ekycRequestBody}) async {
    showLoaderDialog(context);
    update();
    Map parameter = {
      'img': ekycRequestBody.adhaarPicUlr +
          ',' +
          ekycRequestBody.adhaarBackPicUrl +
          ',' +
          ekycRequestBody.panPicUrl,
        'aadhaar_number':ekycRequestBody.aadhaarNumber,
        'pan_number':ekycRequestBody.panNumber,
      'bank_name': ekycRequestBody.bankName,
      'ifsc_code': ekycRequestBody.ifscCode,
      'account_number': ekycRequestBody.accountNumber,
      'bank_holder': ekycRequestBody.bankHolderName,
      'upi': ekycRequestBody.upi,
      'default': '0'
    };
    debugger();
    print(parameter);
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.requestEkyc, bodyParams: parameter);
    print(response);
    Navigator.pop(context);
    if (response['status'] == 200) {
      Messages().showErrorMsg(
          context: context, message: 'EKyc Data is Successfully submited');
      Navigator.pop(context);
      checkKyc(context);
    } else {}

    update();
  }

  Future<MyPaidTeamApiResponse?> getMyPaidTeam(
      {required matchId, required context}) async {
    showLoaderDialog(context);
    Map parameter = {'match_id': matchId};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.myPaidTeam, bodyParams: parameter);
    print(response);
    //  debugger();
    Navigator.pop(context);
    if (response['status'] == 200) {
      myPaidTeamApiResponse = MyPaidTeamApiResponse.fromJson(response);
      update();
      return myPaidTeamApiResponse;
    } else {
      return null;
    }
  }

  Future<MyPaidTeamApiResponse?> getMyTeam(
      {required matchId, required context}) async {
    showLoaderDialog(context);
    Map parameter = {'match_id': matchId};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.myTeamApi, bodyParams: parameter);
    print(response);
    //  debugger();
    Navigator.pop(context);
    if (response['status'] == 200) {
      myPaidTeamApiResponse = MyPaidTeamApiResponse.fromJson(response);
      update();
      return myPaidTeamApiResponse;
    } else {
      return null;
    }
  }

  void cloneTeam(
      {required context,
      required teamId,
      required Matches matches,
      required Contest contest}) async {
    showLoaderDialog(context);
    update();
    debugger();
    Map parameter = {'team_id': teamId};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.cloneTeam, bodyParams: parameter);
    print(response);
    debugger();
    Navigator.pop(context);
    if (response['status'] == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PickPlayerScreen(
          matches: matches,
          contest: contest,
          myTeamId: response['data']['id'].toString(),
        );
      }));
      // getMyTeamSquad(context,response['data']['match_id'].toString(),response['data']['id'].toString());
    } else {
      // Navigator.pop(context);
    }

    update();
  }

  void getMyTeamSquad(context, matchId, teamId, t1Id, t2Id) async {
    Map parameter = {
      NetworkConstant.MatchId: matchId,
      NetworkConstant.Designationid: '0',
      NetworkConstant.MyTeam: '1',
      NetworkConstant.MyTeamId: teamId
    };
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.Get_Squad, bodyParams: parameter);
    // debugger();
    getSquadApiResponse = GetSquadApiResponse.fromJson(response);
    // Navigator.pop(context);
    await devidePlayersAccordingToTitle();
    clasifyChoosedPlayer(t1Id, t2Id);
    update();
  }

  void setReminder(String matchId, context) async {
    Map parameter = {
      NetworkConstant.MatchId: matchId,
    };
    // debugger();
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.set_reminder, bodyParams: parameter);
    // debugger();
    print(response);
    Messages().showMsg(context: context, message: response['message']);
  }

  GetPromoCode? getPromoCodeApiResponse;
  TextEditingController promocodeController = new TextEditingController();
  void getPromoCode() async {
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.applyPromoCode, bodyParams: {});
    if (response['status'] == 200) {
      getPromoCodeApiResponse = GetPromoCode.fromJson(response);
      promocodeController.text = getPromoCodeApiResponse!.data[0].code;
    }
    update();
  }

  String appliedPromoCode = '';
  void applyPromoCode(String code, context) async {
    showLoaderDialog(context);
    Map parameter = {'code': code};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.validatePromoCode, bodyParams: parameter);

    Navigator.pop(context);
   // debugger();
    if (response['status'] == 200) {
      appliedPromoCode = code;
      Messages().showMsg(
          context: context, message: 'Promocode successfully applied.');
    }else{
       Messages().showErrorMsg(
          context: context, message: response['message']);
    }
    update();
  }

  void removeAppliedCode() async {
    appliedPromoCode='';
    update();
  }




  void requestForWithdrawal(
      String amount, context, selectedPaymentMethod) async {
   if(double.parse(splashDataApiResponse.data.withdrawMinimum)<=double.parse(amount)){
     showLoaderDialog(context);
    Map parameter = {'amount': amount, 'is_default': selectedPaymentMethod};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.requestForWithdrawal, bodyParams: parameter);
    // debugger();
    Navigator.pop(context);
    if (response['status'] == 200) {
      Messages().showErrorMsg(context: context, message: response['message']);
      getWalletApi(context);
    } else {
      Messages().showErrorMsg(context: context, message: response['message']);
    }
    update();
   }else{
 Messages().showErrorMsg(context: context, message: 'Minimum Withdrawal should be ${splashDataApiResponse.data.withdrawMinimum}');
   }
  }

  // Future<GetMatchesApiResponse> getMatchData(context, matchId) async {
  //   Map parameter = {
  //     NetworkConstant.MatchId: matchId,

  //   };
  //   showLoaderDialog(context);
  //   var response = await apiProvider.postAfterAuth(
  //       routeUrl: NetworkConstant.quizByMatchId, bodyParams: parameter);
  //   debugger();
  //   print(response);
  //   Navigator.pop(context);
  //    return  GetMatchesApiResponse.fromJson(response);

  // }

  void callUpdateDialog(
    context,
  ) async {
    final info = await PackageInfo.fromPlatform();
    var currentVersion = getExtendedVersionNumber(info.version);
    var newVersion;
    var launchUrl;
    if (Platform.isAndroid) {
      newVersion =
          getExtendedVersionNumber(splashDataApiResponse.data.androidVersion);
      launchUrl = splashDataApiResponse.data.androidApkUrl;
    } else {
      newVersion =
          getExtendedVersionNumber(splashDataApiResponse.data.iosVersion);
      launchUrl = splashDataApiResponse.data.iosApkUrl;
    }

    if (newVersion > currentVersion) {
      showModalBottomSheet(
          // isScrollControlled: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          context: context,
          builder: (context) {
            return UpdateDialog(
              apkUrl: launchUrl,
            );
          });
    } else {
      print("update not avaiable");
    }
  }

  int getExtendedVersionNumber(String version) {
    List versionCells = version.split('.');
    versionCells = versionCells.map((i) => int.parse(i)).toList();
    return versionCells[0] * 100000 + versionCells[1] * 1000 + versionCells[2];
  }
}
