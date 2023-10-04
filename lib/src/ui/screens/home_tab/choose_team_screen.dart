import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/models/GetContestListApiResponse.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/Leader_baord_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/choose_team_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/pick_player_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/winning_tab_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/live_contest_screens/live_team_preview.dart';
import 'package:cricket_fantacy/src/ui/screens/wallets/wallet_screen.dart';
import 'package:cricket_fantacy/src/ui/widgets/mega_contest_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/multiple_contest_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
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

class ChooseTeamPage extends StatefulWidget {
  final Matches matches;
  final Contest contest;
  ChooseTeamPage({required this.matches, required this.contest});

  @override
  State<ChooseTeamPage> createState() => _ChooseTeamPageState();
}

class _ChooseTeamPageState extends State<ChooseTeamPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  var controller = Get.put(HomeController());
  late TabController _secondTabController;

  @override
  void initState() {
    _secondTabController = TabController(length: 2, vsync: this);
    _calculateTimeRemaining();
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
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return controller.myPaidTeamApiResponse == null
                ? shimerEffect(length: 4, context: context)
                : ListView.builder(
                    itemCount: controller.myPaidTeamApiResponse!.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              // color: ColorConstant.primaryWhiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                              color: ColorConstant.primaryWhiteColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                //  height: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                // height: 120,
                                width: MediaQuery.of(context).size.width / 1,
                                child: Column(
                                  children: [
                                    Container(
                                      // height: 100,
                                      width:
                                          MediaQuery.of(context).size.width / 1,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          color: ColorConstant.greenColor),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "${controller
                                                                              .myPaidTeamApiResponse!
                                                                              .data[index].name}",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .primaryWhiteColor,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Container(
                                                              height: 40,
                                                                    width: 40,
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                    height: 40,
                                                                    width: 40,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            color: Colors
                                                                                .white,
                                                                            shape: BoxShape
                                                                                .circle,
                                                                            image:
                                                                                DecorationImage(
                                                                              image:
                                                                                  NetworkImage(
                                                                                controller
                                                                                    .myPaidTeamApiResponse!
                                                                                    .data[index]
                                                                                    .captain
                                                                                    .image,
                                                            
                                                                                //  width: 100,
                                                                              ),
                                                                              fit: BoxFit
                                                                                  .contain,
                                                                            )),
                                                                  ),
                                                               Positioned(
                                                                right: 0,
                                                                top: 2,
                                                                 child: Image.network(
                                                               
                                                                  controller
                                                                                      .myPaidTeamApiResponse!
                                                                                      .data[index]
                                                                                      .captain.team.teamImage,
                                                               
                                                                                      height: 15,
                                                                                      width: 15,
                                                                                      
                                                                 ),
                                                               )
                                                               
                                                                ],
                                                              ),
                                                            ),
                                                            Text(
                                                              controller
                                                                  .myPaidTeamApiResponse!
                                                                  .data[index]
                                                                  .captain
                                                                  .name,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            SizedBox(
                                                              height: 6,
                                                            ),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  color: Colors
                                                                      .deepOrange),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        6,
                                                                        1,
                                                                        6,
                                                                        1),
                                                                child: Text(
                                                                  'Captain',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          9,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            SizedBox(
                                                               height: 40,
                                                                    width: 40,
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                    height: 40,
                                                                    width: 40,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            color: Colors
                                                                                .white,
                                                                            shape: BoxShape
                                                                                .circle,
                                                                            image:
                                                                                DecorationImage(
                                                                              image:
                                                                                  NetworkImage(
                                                                                controller
                                                                                    .myPaidTeamApiResponse!
                                                                                    .data[index]
                                                                                    .viceCaptain
                                                                                    .image,
                                                            
                                                                                //  width: 100,
                                                                              ),
                                                                              fit: BoxFit
                                                                                  .contain,
                                                                            )),
                                                                  ),
                                                                   Positioned(
                                                                right: 0,
                                                                top: 2,
                                                                 child: Image.network(
                                                               
                                                                  controller
                                                                                      .myPaidTeamApiResponse!
                                                                                      .data[index]
                                                                                      .viceCaptain.team.teamImage,
                                                               
                                                                                      height: 15,
                                                                                      width: 15,
                                                                                      
                                                                 ),
                                                               )
                                                                ],
                                                              ),
                                                            ),
                                                            Text(
                                                              controller
                                                                  .myPaidTeamApiResponse!
                                                                  .data[index]
                                                                  .viceCaptain
                                                                  .name,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            SizedBox(
                                                              height: 6,
                                                            ),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  color: Colors
                                                                      .yellow),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        6,
                                                                        1,
                                                                        6,
                                                                        1),
                                                                child: Text(
                                                                  'Vice Captain',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          9,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 60,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black38,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "WK",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white60,
                                                            fontSize: 10),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white10,
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          controller
                                                              .myPaidTeamApiResponse!
                                                              .data[index]
                                                              .wk
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 60,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black38,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "BT",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white60,
                                                            fontSize: 10),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white10,
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          controller
                                                              .myPaidTeamApiResponse!
                                                              .data[index]
                                                              .bat
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 60,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black38,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "BL",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white60,
                                                            fontSize: 10),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white10,
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          controller
                                                              .myPaidTeamApiResponse!
                                                              .data[index]
                                                              .bow
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 60,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black38,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "AL",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white60,
                                                            fontSize: 10),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white10,
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          controller
                                                              .myPaidTeamApiResponse!
                                                              .data[index]
                                                              .all
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width:
                                          MediaQuery.of(context).size.width / 1,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                          color: ColorConstant.primaryColor),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return PickPlayerScreen(
                                                    matches: widget.matches,
                                                    contest: widget.contest,
                                                    myTeamId: controller
                                                        .myPaidTeamApiResponse!
                                                        .data[index]
                                                        .teamid,
                                                  );
                                                }));
                                              },
                                              child: Container(
                                                height: 25,
                                               // width: 80,
                                                decoration: BoxDecoration(
                                                    color: Colors.black12,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: 15,
                                                        width: 15,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                           ),
                                                    alignment: Alignment.center,
                                                    child: Image.asset("assets/new_icons/edit.png"
                                                     ,  height: 12,
                                                    )
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "Modify & Join",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                var id = controller
                                                    .myPaidTeamApiResponse!
                                                    .data[index]
                                                    .teamid;
                                                //debugger();
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return LiveTeamPreview(
                                                      teamID: controller
                                                          .myPaidTeamApiResponse!
                                                          .data[index]
                                                          .teamid,
                                                          flag: false,
                                                          userId: controller
                                                          .myPaidTeamApiResponse!
                                                          .data[index]
                                                          .userId,
                                                          
                                                          );
                                                }));
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    color: Colors.black12,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 15,
                                                      width: 15,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          ),
                                                              alignment: Alignment.center,
                                                  child: Image.asset("assets/new_icons/view.png",
                                                   height: 19,
                                                  ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Preview",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.cloneTeam(
                                                    context: context,
                                                    teamId: controller
                                                        .myPaidTeamApiResponse!
                                                        .data[index]
                                                        .teamid,
                                                    matches: widget.matches,
                                                    contest: widget.contest);
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    color: Colors.black12,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 15,
                                                      width: 15,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                         ),
                                                         alignment: Alignment.center,
                                                  child: Image.asset("assets/new_icons/clone.png",
                                                  height: 12,
                                                  ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Clone",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );

            ;
          }),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PickPlayerScreen(
                    matches: widget.matches,
                    contest: widget.contest,
                    myTeamId: '',
                  );
                }));
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
                      "Create Other Team",
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
        ),
      ),
    );
  }

  // void changeIndex(int index) {
  //   _currentIndex = index;
  //   setState(() {});
  // }

  //  child: Column(
  //                                 crossAxisAlignment:
  //                                     CrossAxisAlignment.start,
  //                                 children: [
  //                                   Container(
  //                                     height: 40,
  //                                     color: Colors.black12,
  //                                     child: Row(
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       children: [
  //                                         Row(
  //                                           children: [
  //                                             Container(
  //                                               width: MediaQuery.of(context)
  //                                                       .size
  //                                                       .width /
  //                                                   3,
  //                                               child: Padding(
  //                                                 padding:
  //                                                     const EdgeInsets.only(
  //                                                         left: 10),
  //                                                 child: Text(
  //                                                   controller
  //                                                       .myPaidTeamApiResponse!
  //                                                       .data[index]
  //                                                       .name,
  //                                                   style: TextStyle(
  //                                                       color: ColorConstant
  //                                                           .primaryWhiteColor,
  //                                                       fontSize: 14,
  //                                                       fontWeight:
  //                                                           FontWeight.w600),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                             Text(
  //                                               "(T${index + 1})",
  //                                               style: TextStyle(
  //                                                   color: ColorConstant
  //                                                       .primaryWhiteColor,
  //                                                   fontSize: 14,
  //                                                   fontWeight:
  //                                                       FontWeight.w600),
  //                                             ),
  //                                           ],
  //                                         ),
  //                                         Padding(
  //                                           padding: const EdgeInsets.only(
  //                                               right: 10.0),
  //                                           child: Icon(
  //                                             Icons.share,
  //                                             size: 20,
  //                                             color: ColorConstant
  //                                                 .primaryWhiteColor,
  //                                           ),
  //                                         )
  //                                       ],
  //                                     ),
  //                                   ),
  //                                   Padding(
  //                                     padding: const EdgeInsets.all(10.0),
  //                                     child: Row(
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       children: [
  //                                         Column(
  //                                           crossAxisAlignment:
  //                                               CrossAxisAlignment.start,
  //                                           children: [
  //                                             Text(
  //                                               "Points",
  //                                               style: TextStyle(
  //                                                   color: ColorConstant
  //                                                       .primaryWhiteColor,
  //                                                   fontSize: 14,
  //                                                   fontWeight:
  //                                                       FontWeight.w600),
  //                                             ),
  //                                             SizedBox(
  //                                               height: 8,
  //                                             ),
  //                                             Text(
  //                                               controller
  //                                                   .myPaidTeamApiResponse!
  //                                                   .data[index]
  //                                                   .captain
  //                                                   .points,
  //                                               style: TextStyle(
  //                                                   color: ColorConstant
  //                                                       .primaryWhiteColor,
  //                                                   fontSize: 14,
  //                                                   fontWeight:
  //                                                       FontWeight.w600),
  //                                             ),
  //                                           ],
  //                                         ),
  //                                         Row(
  //                                           children: [
  //                                             Container(
  //                                               // height: 60,
  //                                               // width: 100,
  //                                               child: Stack(
  //                                                 children: [
  //                                                   Column(
  //                                                     children: [
  //                                                       Image.network(
  //                                                         controller
  //                                                             .myPaidTeamApiResponse!
  //                                                             .data[index]
  //                                                             .captain
  //                                                             .image,
  //                                                         height: 50,
  //                                                         //  width: 100,
  //                                                       ),
  //                                                       Container(
  //                                                         width: 50,
  //                                                         //  height: 10,
  //                                                         decoration: BoxDecoration(
  //                                                             color: Colors
  //                                                                 .black,
  //                                                             borderRadius:
  //                                                                 BorderRadius
  //                                                                     .circular(
  //                                                                         2)),
  //                                                         child: Padding(
  //                                                           padding:
  //                                                               const EdgeInsets
  //                                                                       .only(
  //                                                                   top: 2,
  //                                                                   bottom:
  //                                                                       2),
  //                                                           child: Text(
  //                                                             controller
  //                                                                 .myPaidTeamApiResponse!
  //                                                                 .data[index]
  //                                                                 .captain
  //                                                                 .name,
  //                                                             textAlign:
  //                                                                 TextAlign
  //                                                                     .center,
  //                                                             style: TextStyle(
  //                                                                 color: Colors
  //                                                                     .white,
  //                                                                 fontSize:
  //                                                                     7),
  //                                                           ),
  //                                                         ),
  //                                                       )
  //                                                     ],
  //                                                   ),
  //                                                   Positioned(
  //                                                     top: 0,
  //                                                     left: 0,
  //                                                     child: Container(
  //                                                       decoration: BoxDecoration(
  //                                                           shape: BoxShape
  //                                                               .circle,
  //                                                           color:
  //                                                               Colors.black,
  //                                                           border: Border.all(
  //                                                               width: 1,
  //                                                               color: Colors
  //                                                                   .white)),
  //                                                       alignment:
  //                                                           Alignment.center,
  //                                                       child: Padding(
  //                                                         padding:
  //                                                             const EdgeInsets
  //                                                                 .all(5.0),
  //                                                         child: Text(
  //                                                           "C",
  //                                                           style: TextStyle(
  //                                                               color: Colors
  //                                                                   .white,
  //                                                               fontSize: 12),
  //                                                         ),
  //                                                       ),
  //                                                     ),
  //                                                   )
  //                                                 ],
  //                                               ),
  //                                             ),
  //                                             SizedBox(
  //                                               width: 40,
  //                                             ),
  //                                             Container(
  //                                               // height: 60,
  //                                               // width: 100,
  //                                               child: Stack(
  //                                                 children: [
  //                                                   Column(
  //                                                     children: [
  //                                                       Image.network(
  //                                                         controller
  //                                                             .myPaidTeamApiResponse!
  //                                                             .data[index]
  //                                                             .viceCaptain
  //                                                             .image,
  //                                                         height: 50,
  //                                                         //  width: 100,
  //                                                       ),
  //                                                       Container(
  //                                                         width: 50,
  //                                                         //  height: 10,
  //                                                         decoration: BoxDecoration(
  //                                                             color: Colors
  //                                                                 .black,
  //                                                             borderRadius:
  //                                                                 BorderRadius
  //                                                                     .circular(
  //                                                                         2)),
  //                                                         child: Padding(
  //                                                           padding:
  //                                                               const EdgeInsets
  //                                                                       .only(
  //                                                                   top: 2,
  //                                                                   bottom:
  //                                                                       2),
  //                                                           child: Text(
  //                                                             controller
  //                                                                 .myPaidTeamApiResponse!
  //                                                                 .data[index]
  //                                                                 .viceCaptain
  //                                                                 .name,
  //                                                             textAlign:
  //                                                                 TextAlign
  //                                                                     .center,
  //                                                             style: TextStyle(
  //                                                                 color: Colors
  //                                                                     .white,
  //                                                                 fontSize:
  //                                                                     7),
  //                                                           ),
  //                                                         ),
  //                                                       )
  //                                                     ],
  //                                                   ),
  //                                                   Positioned(
  //                                                     top: 0,
  //                                                     left: 0,
  //                                                     child: Container(
  //                                                       decoration: BoxDecoration(
  //                                                           shape: BoxShape
  //                                                               .circle,
  //                                                           color:
  //                                                               Colors.black,
  //                                                           border: Border.all(
  //                                                               width: 1,
  //                                                               color: Colors
  //                                                                   .white)),
  //                                                       alignment:
  //                                                           Alignment.center,
  //                                                       child: Padding(
  //                                                         padding:
  //                                                             const EdgeInsets
  //                                                                 .all(5.0),
  //                                                         child: Text(
  //                                                           "VC",
  //                                                           style: TextStyle(
  //                                                               color: Colors
  //                                                                   .white,
  //                                                               fontSize: 8),
  //                                                         ),
  //                                                       ),
  //                                                     ),
  //                                                   )
  //                                                 ],
  //                                               ),
  //                                             )
  //                                           ],
  //                                         )
  //                                       ],
  //                                     ),
  //                                   ),
  //                                   Container(
  //                                       height: 30,
  //                                       color: Colors.black12,
  //                                       child: Padding(
  //                                         padding: const EdgeInsets.only(
  //                                             left: 10, right: 10),
  //                                         child: Row(
  //                                             mainAxisAlignment:
  //                                                 MainAxisAlignment
  //                                                     .spaceBetween,
  //                                             children: [
  //                                               Row(
  //                                                 children: [
  //                                                   Text(
  //                                                     "WK  ",
  //                                                     style: TextStyle(
  //                                                         color:
  //                                                             Colors.white60,
  //                                                         fontSize: 15,
  //                                                         fontWeight:
  //                                                             FontWeight
  //                                                                 .w500),
  //                                                   ),
  //                                                   Text(
  //                                                     controller
  //                                                         .myPaidTeamApiResponse!
  //                                                         .data[index]
  //                                                         .wk
  //                                                         .toString(),
  //                                                     style: TextStyle(
  //                                                         color: Colors.white,
  //                                                         fontSize: 15,
  //                                                         fontWeight:
  //                                                             FontWeight
  //                                                                 .w500),
  //                                                   )
  //                                                 ],
  //                                               ),
  //                                               Row(
  //                                                 children: [
  //                                                   Text(
  //                                                     "BAT  ",
  //                                                     style: TextStyle(
  //                                                         color:
  //                                                             Colors.white60,
  //                                                         fontSize: 15,
  //                                                         fontWeight:
  //                                                             FontWeight
  //                                                                 .w500),
  //                                                   ),
  //                                                   Text(
  //                                                     controller
  //                                                         .myPaidTeamApiResponse!
  //                                                         .data[index]
  //                                                         .bat
  //                                                         .toString(),
  //                                                     style: TextStyle(
  //                                                         color: Colors.white,
  //                                                         fontSize: 15,
  //                                                         fontWeight:
  //                                                             FontWeight
  //                                                                 .w500),
  //                                                   )
  //                                                 ],
  //                                               ),
  //                                               Row(
  //                                                 children: [
  //                                                   Text(
  //                                                     "AR  ",
  //                                                     style: TextStyle(
  //                                                         color:
  //                                                             Colors.white60,
  //                                                         fontSize: 15,
  //                                                         fontWeight:
  //                                                             FontWeight
  //                                                                 .w500),
  //                                                   ),
  //                                                   Text(
  //                                                     controller
  //                                                         .myPaidTeamApiResponse!
  //                                                         .data[index]
  //                                                         .all
  //                                                         .toString(),
  //                                                     style: TextStyle(
  //                                                         color: Colors.white,
  //                                                         fontSize: 15,
  //                                                         fontWeight:
  //                                                             FontWeight
  //                                                                 .w500),
  //                                                   )
  //                                                 ],
  //                                               ),
  //                                               Row(
  //                                                 children: [
  //                                                   Text(
  //                                                     "BOWL  ",
  //                                                     style: TextStyle(
  //                                                         color:
  //                                                             Colors.white60,
  //                                                         fontSize: 15,
  //                                                         fontWeight:
  //                                                             FontWeight
  //                                                                 .w500),
  //                                                   ),
  //                                                   Text(
  //                                                     controller
  //                                                         .myPaidTeamApiResponse!
  //                                                         .data[index]
  //                                                         .bow
  //                                                         .toString(),
  //                                                     style: TextStyle(
  //                                                         color: Colors.white,
  //                                                         fontSize: 15,
  //                                                         fontWeight:
  //                                                             FontWeight
  //                                                                 .w500),
  //                                                   )
  //                                                 ],
  //                                               )
  //                                             ]),

  //                                       )),

  //                                Container(
  //                                       height: 30,
  //                                       color: Colors.black12,)

  //                                 ],
  //                               ),
}
