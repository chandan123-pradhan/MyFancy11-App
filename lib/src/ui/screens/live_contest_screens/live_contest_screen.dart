import 'package:cricket_fantacy/src/controllers/live_contest_controller.dart';
import 'package:cricket_fantacy/src/models/get_my_mateches_api_response.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/Leader_baord_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/winning_tab_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/live_contest_screens/my_contest_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/live_contest_screens/my_team_widget_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/wallets/wallet_screen.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LiveContestScreen extends StatefulWidget {
  final MyMatchModel myMatchModel;
  LiveContestScreen({required this.myMatchModel});

  @override
  State<LiveContestScreen> createState() => _LiveContestScreenState();
}

class _LiveContestScreenState extends State<LiveContestScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var controller = Get.put(LiveContestController());
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    print(widget.myMatchModel.matchId);
    _calculateTimeRemaining();
    controller.getData(widget.myMatchModel.matchId);

    // TODO: implement initState
    super.initState();
  }

  Duration? remainingDuration;

  var targetDate;
  _calculateTimeRemaining() {
    DateTime now = DateTime.now();
    targetDate = DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(widget.myMatchModel.matchDateTime);
    remainingDuration = targetDate.difference(now);

    int hours = remainingDuration!.inHours;
    int minutes = remainingDuration!.inMinutes.remainder(60);
    print('$hours hours and $minutes minutes remaining');
    //return '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (controller.isMyContestDetailsPageEnable == false) {
          controller.closeTimer(context);
          return Future.value(true);
        } else {
          controller.updateMycontestScreen(
            ''

          );
          return Future.value(false);
        }
      },
      child: Scaffold(
        backgroundColor: ColorConstant.bg_color,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorConstant.primaryBlackColor,
          leading: InkWell(
            onTap: () {
              if (controller.isMyContestDetailsPageEnable == false) {
                controller.closeTimer(context);
              } else {
                controller.updateMycontestScreen('');
              }
            },
            child: Icon(
              Icons.navigate_before,
              size: 30,
              color: ColorConstant.primaryWhiteColor,
            ),
          ),
          centerTitle: false,
          title: Text(
            "Live Match",
            style: TextStyle(
                color: ColorConstant.primaryWhiteColor,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WalletScreen();
                  }));
                },
                child: Icon(
                  Icons.help_outline_outlined,
                  size: 27,
                  color: ColorConstant.primaryWhiteColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WalletScreen();
                    }));
                  },
                  child: Container(
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.white),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "PTS",
                      style: TextStyle(color: Colors.white, fontSize: 9),
                    ),
                  )),
            )
          ],
        ),
        body: Column(
          children: [
            GetBuilder<LiveContestController>(
                init: LiveContestController(),
                builder: (controller) {
                  return controller.liveMatchUpdateApiResponse == null
                      ? Container(
                          height: MediaQuery.of(context).size.height / 3,
                          child: Center(child: Text("Loading")))
                      : Container(
                          // height: 225,
                          color: ColorConstant.primaryBlackColor,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: controller
                                            .liveMatchUpdateApiResponse!['data']
                                        [0]['match_status'] ==
                                    'Fixture'
                                ? Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.liveMatchUpdateApiResponse![
                                                        'data'][0]['team1']
                                                    ['team_name'],
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 16),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              controller.liveMatchUpdateApiResponse![
                                                                          'data']
                                                                      [
                                                                      0]['team1']
                                                                  [
                                                                  'team_image'],
                                                            ),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                controller.liveMatchUpdateApiResponse![
                                                        'data'][0]['team2']
                                                    ['team_name'],
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 16),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              controller.liveMatchUpdateApiResponse![
                                                                          'data']
                                                                      [
                                                                      0]['team2']
                                                                  [
                                                                  'team_image'],
                                                            ),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Match Start Will be : ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                          CountdownTimer(
                                            endWidget:
                                                remainingDuration!.inHours < 0
                                                    ? const Text(
                                                        "Completed",
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      )
                                                    : const Text(
                                                        "Live",
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                            endTime: targetDate
                                                .millisecondsSinceEpoch,
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.liveMatchUpdateApiResponse![
                                                        'data'][0]['team1']
                                                    ['team_name'],
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 16),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              controller.liveMatchUpdateApiResponse![
                                                                          'data']
                                                                      [
                                                                      0]['team1']
                                                                  [
                                                                  'team_image'],
                                                            ),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  controller.liveMatchUpdateApiResponse![
                                                                  'data'][0][
                                                              'match_status'] ==
                                                          'Fixture'
                                                      ? Container()
                                                      : Text(
                                                          controller.liveMatchUpdateApiResponse![
                                                                      'data'][0]
                                                                  [
                                                                  'team1Score'] ??
                                                              '',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  controller.liveMatchUpdateApiResponse![
                                                                  'data'][0][
                                                              'match_status'] ==
                                                          'Fixture'
                                                      ? Container()
                                                      : Text(
                                                          controller.liveMatchUpdateApiResponse![
                                                                      'data'][0]
                                                                  [
                                                                  'team1Over'] ??
                                                              '',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                controller.liveMatchUpdateApiResponse![
                                                        'data'][0]['team2']
                                                    ['team_name'],
                                                style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 16),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  controller.liveMatchUpdateApiResponse![
                                                                  'data'][0][
                                                              'match_status'] ==
                                                          'Fixture'
                                                      ? Container()
                                                      : Text(
                                                          controller.liveMatchUpdateApiResponse![
                                                                      'data'][0]
                                                                  [
                                                                  'team2Score'] ??
                                                              '',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                  controller.liveMatchUpdateApiResponse![
                                                                  'data'][0][
                                                              'match_status'] ==
                                                          'Fixture'
                                                      ? Container()
                                                      : SizedBox(
                                                          width: 10,
                                                        ),
                                                  controller.liveMatchUpdateApiResponse![
                                                                  'data'][0][
                                                              'match_status'] ==
                                                          'Fixture'
                                                      ? Container()
                                                      : Text(
                                                          controller.liveMatchUpdateApiResponse![
                                                                      'data'][0]
                                                                  [
                                                                  'team2Over'] ??
                                                              '',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              controller.liveMatchUpdateApiResponse![
                                                                          'data']
                                                                      [
                                                                      0]['team2']
                                                                  [
                                                                  'team_image'],
                                                            ),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        controller.liveMatchUpdateApiResponse![
                                            'data'][0]['match_status_note'],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        color: Colors.white70,
                                        height: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.23,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                            controller.liveMatchUpdateApiResponse![
                                                                        'current']['c_data']
                                                                    [0]['strik']
                                                                ['name'],

                                                            //"Virat Kohali",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                    controller.liveMatchUpdateApiResponse![
                                                                    'data'][0][
                                                                'match_status'] ==
                                                            'Fixture'
                                                        ? Container()
                                                        : Text(
                                                            "${controller.liveMatchUpdateApiResponse!['current']['c_data'][0]['strik']['strik_data']['score']} (${controller.liveMatchUpdateApiResponse!['current']['c_data'][0]['strik']['strik_data']['ball']})",

                                                            //    "10 (10)",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                controller.liveMatchUpdateApiResponse![
                                                                'data'][0]
                                                            ['match_status'] ==
                                                        'Fixture'
                                                    ? Container()
                                                    : Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            controller.liveMatchUpdateApiResponse![
                                                                        'current']['c_data']
                                                                    [
                                                                    0]['batsman']
                                                                ['fullname'],
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .white70,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${controller.liveMatchUpdateApiResponse!['current']['c_data'][0]['batsman']['batsman_data']['score']} (${controller.liveMatchUpdateApiResponse!['current']['c_data'][0]['batsman']['batsman_data']['ball']})",
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .white70,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          )
                                                        ],
                                                      )
                                              ],
                                            ),
                                          ),
                                           Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(context).size.width/4,
                                                            child: Text(
                                                              controller.liveMatchUpdateApiResponse![
                                                                          'current']['c_data']
                                                                      [
                                                                      0]['bowler']
                                                                  ['fullname'],
                                                                  overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.white,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "${controller.liveMatchUpdateApiResponse!['current']['c_data'][0]['bowler']['bowler_data']['wickets']}/${controller.liveMatchUpdateApiResponse!['current']['c_data'][0]['bowler']['bowler_data']['runs']} (${controller.liveMatchUpdateApiResponse!['current']['c_data'][0]['bowler']['bowler_data']['overs']})",

                                                            //  "0/11 (1.0)",
                                                            
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      controller.liveMatchUpdateApiResponse![
                                                                      'data'][0]
                                                                  [
                                                                  'match_status'] ==
                                                              'Fixture'
                                                          ? Container()
                                                          : SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              reverse: true,
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  for (int i =
                                                                          (controller.liveMatchUpdateApiResponse![
                                                                        'current']['list'].length)-1;
                                                                      i >=0
                                                                          
                                                                              ;
                                                                      i--)
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.fromLTRB(
                                                                              4,
                                                                              0,
                                                                              4,
                                                                              0),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            22,
                                                                        width:
                                                                            22,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                          border: Border.all(
                                                                              width: 1,
                                                                              color: Colors.white),
                                                                        ),
                                                                        alignment:
                                                                            Alignment.center,
                                                                        child:
                                                                            Text(
                                                                          controller.liveMatchUpdateApiResponse![
                                                                        'current']['list'][i]['is_wicket'] == true
                                                                              ? 'W'
                                                                              : controller.liveMatchUpdateApiResponse![
                                                                        'current']['list'][i]['runs'].toString(),
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 9),
                                                                        ),
                                                                      ),
                                                                    )
                                                                ],
                                                              ),
                                                            ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                        ],
                                      )
                                    ],
                                  ),
                          ),
                        );
                }),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: GetBuilder<LiveContestController>(
                    init: LiveContestController(),
                    builder: (controller) {
                      return TabBar(
                        isScrollable: true,
                        controller: _tabController,
                        indicatorColor: ColorConstant.primaryColor,
                        indicatorWeight: 3,
                        labelColor: ColorConstant.primaryBlackColor,
                        tabs: [
                          controller.isMyContestDetailsPageEnable == false
                              ? Tab(
                                  text:
                                      'My Contest (${controller.myContestApiResponse == null ? '' : controller.myContestApiResponse!.data.length})',
                                )
                              : Tab(
                                  text: 'Leaderboard',
                                ),
                          controller.isMyContestDetailsPageEnable == false
                              ? Tab(
                                  text:
                                      "My Team (${controller.getMyTeamApiResponse == null ? '' : controller.getMyTeamApiResponse!.data.length})")
                              : Tab(
                                  text: 'Winnings',
                                ),
                          Tab(text: 'Commentary'),
                          Tab(text: "Scorecard"),
                         
                        ],
                      );
                    }),
              ),
            ),
            Expanded(
              child: GetBuilder<LiveContestController>(
                init: LiveContestController(),
                builder: (controller) {
                  return TabBarView(
                    controller: _tabController,
                    children: [
                      controller.isMyContestDetailsPageEnable
                          ? LeaderboardTab(
                            contestId:
                            controller.tappedContestId
                          )
                          : MyContestTab(),
                      controller.isMyContestDetailsPageEnable
                          ? WinningTab(
                            contestId:
                            controller.tappedContestId
                          )
                          : MyTeamWidgetTab(),

                          Container(),
                          Container(),
                        
                    ],
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
