import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/models/GetContestListApiResponse.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/Leader_baord_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/choose_team_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/pick_player_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/winning_tab_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/wallets/wallet_screen.dart';
import 'package:cricket_fantacy/src/ui/widgets/mega_contest_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/multiple_contest_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/steper_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class JoinContest extends StatefulWidget {
  final Matches matches;
  final Contest contest;
  JoinContest({required this.matches, required this.contest});

  @override
  State<JoinContest> createState() => _UpcommingMatchesDetailsState();
}

class _UpcommingMatchesDetailsState extends State<JoinContest>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  var controller = Get.put(HomeController());
  late TabController _secondTabController;
  void callGetWinningInfo() {
    //controller.getWinningInfo(context, widget.contest.contestId);
    // controller.getLeaderBoardResponse(context, widget.contest.contestId);
  }
  @override
  void initState() {
    _secondTabController = TabController(length: 2, vsync: this);
    _calculateTimeRemaining();
    callGetWinningInfo();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _secondTabController.dispose();
  }

  var targetDate;

  _calculateTimeRemaining() {
    DateTime now = DateTime.now();
    targetDate =
        DateFormat("yyyy-MM-dd hh:mm:ss").parse(widget.matches.matchDateTime);
    Duration remainingDuration = targetDate.difference(now);

    int hours = remainingDuration.inHours;
    int minutes = remainingDuration.inMinutes.remainder(60);
    print('$hours hours and $minutes minutes remaining');
    //return '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bg_color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.navigate_before,
            size: 30,
            color: ColorConstant.primaryWhiteColor,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.matches.team2.teamName} Vs ${widget.matches.team1.teamName}",
              style: TextStyle(
                  color: ColorConstant.primaryWhiteColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            CountdownTimer(
              endWidget: Text("Live"),
              endTime: targetDate.millisecondsSinceEpoch,
              textStyle: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WalletScreen();
                }));
              },
              child: Container(
width: 30,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    ImageUitls.Wallet_icon,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Price Pool",
              style: TextStyle(
                  color: ColorConstant.primaryBlackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "₹ ${widget.contest.prizePool}",
              style: TextStyle(
                  color: ColorConstant.primaryBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              width: MediaQuery.of(context).size.width / 1,
              child: LinearProgressIndicator(
                minHeight: 4,
                value:  ((int.parse(widget.contest.joinTeam)/int.parse(widget.contest.totalTeam))*100)/100,
                backgroundColor: Colors.red[50],
                valueColor:
                    AlwaysStoppedAnimation<Color>(ColorConstant.primaryColor),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${int.parse(widget.contest.totalTeam) - int.parse(widget.contest.joinTeam)} spots left",
                  style: TextStyle(
                      color: ColorConstant.primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "${int.parse(widget.contest.totalTeam)} spots",
                  style: TextStyle(
                      color: ColorConstant.disableColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () async {
                controller
                    .getMyPaidTeam(matchId: widget.matches.matchId.toString(),context: context)
                    .then((value) {
                  if (value != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ChooseTeamPage(
                        matches: widget.matches,
                        contest: widget.contest,
                      );
                    }));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PickPlayerScreen(
                        matches: widget.matches,
                        contest: widget.contest,
                        myTeamId: '',
                      );
                    }));
                  }
                });

                // Navigator.push(context, MaterialPageRoute(builder: (context){
                //   return  PickPlayerScreen(
                //     matches: widget.matches,
                //     contest: widget.contest,
                //   );
                // }));
              },
              child: Container(
                height: 35,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ColorConstant.greenColor),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "JOIN  ",
                      style: TextStyle(
                          color: ColorConstant.primaryWhiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    // Text(
                    //   "₹49",
                    //   style: TextStyle(
                    //       decoration: TextDecoration.lineThrough,
                    //       color: Color.fromRGBO(255, 255, 255, 1),
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w500),
                    // ),
                    Text(
                      " ₹${widget.contest.entry}",
                      style: TextStyle(
                          color: ColorConstant.primaryWhiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Container(
            // height: 100,
            child: Column(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Row(
                            children: [
                                                    Image.asset('assets/new_icons/winner_not.png',
                       height: 14,
                       width: 14,
                       ),
                              Text(
                                " ₹${widget.contest.firstPrize}  ",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Row(
                            children: [
                             Image.asset('assets/new_icons/trophy.png',
                       height: 11,
                       width: 11,
                       ),
                              Text(
                                " ${widget.contest.winPercent}% ",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ]),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 15,
                              color: Colors.black45,
                            ),
                            Text(
                              " Guaranted",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    //height: 40,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(color: Colors.red[100]),
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0, bottom: 5, top: 5),
                      child: Text(
                        widget.contest.contestDescription,
                        // "Earn ₹${widget.contest.firstPrize}   for every ₹${widget.contest.entry}   Spent on a contest entry",
                        style: TextStyle(
                            color: ColorConstant.primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

// SizedBox(height: 10,),
          // Padding(
          //   padding: const EdgeInsets.only(left: 15.0, right: 15,top: 20),
          //   child: Container(
          //       // height: MediaQuery.of(context).size.height/9,
          //       child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       InkWell(
          //         onTap: () {
          //           changeIndex(0);
          //         },
          //         child: Container(
          //           width: MediaQuery.of(context).size.width / 2.2,
          //           height: 45,
          //           decoration: BoxDecoration(
          //             border: Border.all(
          //                 width: 1, color: ColorConstant.primaryColor),
          //             borderRadius: BorderRadius.circular(35),
          //             color: _currentIndex == 0
          //                 ? ColorConstant.primaryColor
          //                 : ColorConstant.un_selected_color,
          //           ),
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Winnings",
          //             style: TextStyle(
          //                 color: _currentIndex == 0
          //                     ? ColorConstant.primaryWhiteColor
          //                     : ColorConstant.primaryColor,
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.w600),
          //           ),
          //         ),
          //       ),
          //       InkWell(
          //         onTap: () {
          //           changeIndex(1);
          //         },
          //         child: Container(
          //           width: MediaQuery.of(context).size.width / 2.2,
          //           height: 45,
          //           decoration: BoxDecoration(
          //             border: Border.all(
          //                 width: 1, color: ColorConstant.primaryColor),
          //             borderRadius: BorderRadius.circular(35),
          //             color: _currentIndex == 1
          //                 ? ColorConstant.primaryColor
          //                 : ColorConstant.un_selected_color,
          //           ),
          //           alignment: Alignment.center,
          //           child: Text(
          //             "Leaderboard",
          //             style: TextStyle(
          //                 color: _currentIndex == 1
          //                     ? ColorConstant.primaryWhiteColor
          //                     : ColorConstant.primaryColor,
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.w600),
          //           ),
          //         ),
          //       )
          //     ],
          //   )),
          // ),

          TabBar(
            isScrollable: true,
            controller: _secondTabController,
            indicatorColor: ColorConstant.primaryColor,
            indicatorWeight: 3,
            labelColor: ColorConstant.primaryBlackColor,
            tabs: const [
              Tab(
                text: 'Winnings',
              ),
              Tab(text: "Leaderboard"),
              // Tab(text: 'Completed'),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _secondTabController,
              children: [
                WinningTab(
                  contestId: widget.contest.contestId,
                ), // Content for Tab 1
                LeaderboardTab(
                  contestId: widget.contest.contestId,
                )
              ],
            ),
          )

          // CarouselSlider(
          //     items: [
          //       _currentIndex == 0
          //           ? WinningTab()
          //           : LeaderboardTab(),
          //      LeaderboardTab()
          //     ],
          //     options: CarouselOptions(
          //       height: MediaQuery.of(context).size.height / 2.3,
          //       aspectRatio: 16 / 9,
          //       viewportFraction: 1.0,
          //       initialPage: 0,
          //       enableInfiniteScroll: false,
          //       reverse: false,
          //       autoPlay: false,
          //       autoPlayInterval: Duration(seconds: 3),
          //       autoPlayAnimationDuration: Duration(milliseconds: 800),
          //       autoPlayCurve: Curves.fastOutSlowIn,
          //       enlargeCenterPage: false,
          //       enlargeFactor: 0.3,
          //       onPageChanged: (index, reason) {
          //         changeIndex(index);
          //         //controller.updateHome2Slider(index);
          //       },
          //       scrollDirection: Axis.horizontal,
          //     )),
        ],
      ),
    );
  }

  void changeIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }
}
