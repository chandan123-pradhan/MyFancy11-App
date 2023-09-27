import 'dart:developer';

import 'package:cricket_fantacy/src/controllers/player_profile_controller.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/models/GetContestListApiResponse.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/players_profile_page.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/team_preview_page.dart';
import 'package:cricket_fantacy/src/ui/screens/wallets/wallet_screen.dart';
import 'package:cricket_fantacy/src/ui/widgets/steper_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PickCaptionViceCaptionScreen extends StatefulWidget {
  final Matches matches;
  final Contest contest;
  final bool isForEdit;
  final String myTeamId;
  PickCaptionViceCaptionScreen(
      {required this.matches,
      required this.contest,
      required this.isForEdit,
      required this.myTeamId});

  @override
  State<PickCaptionViceCaptionScreen> createState() =>
      _PickCaptionViceCaptionScreenState();
}

class _PickCaptionViceCaptionScreenState
    extends State<PickCaptionViceCaptionScreen> {
  int captainIndex = -1;
  int vcIndex = -1;
  var controller = Get.put(HomeController());

  void calculateCaptianAndVc() {
    for (int i = 0; i < controller.choosedPlayerList.length; i++) {
      if (controller.choosedPlayerList[i].isCaptain == '1') {
        controller.choosedCaption(controller.choosedPlayerList[i]);
        captainIndex = i;
// setState(() {});
      }
      if (controller.choosedPlayerList[i].isViceCaptain == '1') {
        controller.choosedViceCaptin(controller.choosedPlayerList[i]);
        vcIndex = i;
        // setState(() {});
      }
    }
  }

  @override
  void initState() {
    _calculateTimeRemaining();
    if (widget.isForEdit) {
      calculateCaptianAndVc();
    }
    // TODO: implement initState
    super.initState();
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
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create Team",
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
      body: Center(
        child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 8,
                        color: ColorConstant.primaryBlackColor,
                      ),
                      StepperWidget(
                        step: 3,
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1,
                        alignment: Alignment.center,
                        color: Colors.grey[200],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Choose Your Captain and Vice Captain",
                              style: TextStyle(
                                  color: ColorConstant.primaryBlackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "C getx 2X Points, VC gets 1.5X Points",
                              style: TextStyle(
                                  color: ColorConstant.primaryBlackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        // color: Colors.grey[200],
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "TYPE",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    "POINTS",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100.0),
                                    child: Text(
                                      "% C BY",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Text(
                                      "% V BY",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: controller.choosedPlayerList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width / 1,
                                decoration: BoxDecoration(
                                    border: Border(
                                  top: BorderSide(
                                      width: 1,
                                      color: ColorConstant.deviderColor),
                                )),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        // width: MediaQuery.of(context).size.width/2.2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return PlayerProfilePage(
                                                    player: controller
                                                            .choosedPlayerList[
                                                        index],
                                                  );
                                                }));
                                              },
                                              child: Container(
                                                height: 70,
                                                width: 80,
                                                child: Stack(children: [
                                                  Image.network(
                                                    controller
                                                        .choosedPlayerList[
                                                            index]
                                                        .image,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    child: Image.network(
                                                      controller
                                                          .choosedPlayerList[
                                                              index]
                                                          .teamImage,
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                  )
                                                  //   Positioned(
                                                  //       left: 0,
                                                  //       top: 0,
                                                  //       child: InkWell(
                                                  //         onTap: (){

                                                  //            Navigator.push(context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) {
                                                  //   return PlayerProfilePage(
                                                  //     player: controller.choosedPlayerList[index],
                                                  //   );
                                                  // })
                                                  // );
                                                  //         },
                                                  //         child: Icon(
                                                  //           Icons
                                                  //               .info_outline_rounded,
                                                  //           size: 20,
                                                  //           color: Colors.black54,
                                                  //         ),
                                                  //       ))
                                                ]),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    controller
                                                        .choosedPlayerList[
                                                            index]
                                                        .name,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "${controller.choosedPlayerList[index].playerPoints} pts",
                                                    style: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  // SizedBox(
                                                  //   height: 5,
                                                  // ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (vcIndex != index) {
                                                controller.choosedCaption(
                                                    controller
                                                            .choosedPlayerList[
                                                        index]);

                                                setState(() {
                                                  captainIndex = index;
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: captainIndex == index
                                                      ? ColorConstant
                                                          .primaryColor
                                                      : Colors.transparent,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: ColorConstant
                                                          .deviderColor)),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "C",
                                                style: TextStyle(
                                                    color: captainIndex == index
                                                        ? ColorConstant
                                                            .primaryWhiteColor
                                                        : Colors.black),
                                              ),
                                            ),
                                          ),
                                          // SizedBox(height: 5,),
                                          // Text(
                                          //     "1.35%",
                                          //     style: TextStyle(
                                          //         color: Colors.black54,
                                          //         fontSize: 15,
                                          //         fontWeight: FontWeight.w500),
                                          //   ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (captainIndex != index) {
                                                controller.choosedViceCaptin(
                                                    controller
                                                            .choosedPlayerList[
                                                        index]);
                                                setState(() {
                                                  vcIndex = index;
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: vcIndex == index
                                                      ? ColorConstant
                                                          .primaryColor
                                                      : Colors.transparent,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: ColorConstant
                                                          .deviderColor)),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "VC",
                                                style: TextStyle(
                                                    color: vcIndex == index
                                                        ? ColorConstant
                                                            .primaryWhiteColor
                                                        : Colors.black),
                                              ),
                                            ),
                                          ),
                                          // SizedBox(height: 5,),
                                          // Text(
                                          //     "1.35%",
                                          //     style: TextStyle(
                                          //         color: Colors.black54,
                                          //         fontSize: 15,
                                          //         fontWeight: FontWeight.w500),
                                          //   ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  // Positioned(
                  //     bottom: 10,
                  //     left: 20,
                  //     child: Container(
                  //       height: 45,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(40),
                  //         color: Colors.black87,
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.grey.withOpacity(0.5),
                  //             spreadRadius: 5,
                  //             blurRadius: 7,
                  //             offset:
                  //                 Offset(0, 3), // changes position of shadow
                  //           ),
                  //         ],
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(left: 15.0, right: 15),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Row(
                  //               children: const [
                  //                 Icon(
                  //                   Icons.remove_red_eye,
                  //                   size: 20,
                  //                   color: ColorConstant.primaryWhiteColor,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 10,
                  //                 ),
                  //                 Text(
                  //                   "PREVIEW",
                  //                   style: TextStyle(
                  //                       color: ColorConstant.primaryWhiteColor,
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.w500),
                  //                 ),
                  //               ],
                  //             ),
                  //             const SizedBox(
                  //               width: 10,
                  //             ),
                  //             const Text(
                  //               "/",
                  //               style: TextStyle(
                  //                   color: Colors.white38,
                  //                   fontSize: 15,
                  //                   fontWeight: FontWeight.w500),
                  //             ),
                  //             const SizedBox(
                  //               width: 10,
                  //             ),
                  //             Row(
                  //               children: const [
                  //                 Icon(
                  //                   Icons.remove_red_eye,
                  //                   size: 20,
                  //                   color: ColorConstant.primaryWhiteColor,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 10,
                  //                 ),
                  //                 Text(
                  //                   "LINEUP",
                  //                   style: TextStyle(
                  //                       color: ColorConstant.primaryWhiteColor,
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.w500),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     )),
                  // Positioned(
                  //     bottom: 10,
                  //     right: 20,
                  //     child: InkWell(
                  //       onTap: () {
                  // if (widget.isForEdit == false &&
                  //     vcIndex != -1 &&
                  //     captainIndex != -1) {
                  //   controller.saveTeam(
                  //       maches: widget.matches,
                  //       contest: widget.contest,
                  //       context: context,
                  //       myTeamID: widget.myTeamId
                  //       );
                  // } else {
                  //   print(widget.myTeamId);
                  //   //debugger();
                  //   controller.saveTeam(
                  //       maches: widget.matches,
                  //       contest: widget.contest,
                  //       context: context,
                  //       myTeamID: widget.myTeamId,

                  //       );
                  // }
                  //       },
                  //       child: Container(
                  //         height: 45,
                  //         width: 100,
                  //         alignment: Alignment.center,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(40),
                  //           color: widget.isForEdit == false &&
                  //                   vcIndex != -1 &&
                  //                   captainIndex != -1
                  //               ? ColorConstant.primaryBlackColor
                  //               : widget.isForEdit
                  //                   ? ColorConstant.primaryBlackColor
                  //                   : Colors.black12,
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.grey.withOpacity(0.5),
                  //               spreadRadius: 5,
                  //               blurRadius: 7,
                  //               offset:
                  //                   Offset(0, 3), // changes position of shadow
                  //             ),
                  //           ],
                  //         ),
                  //         child: Padding(
                  //           padding:
                  //               const EdgeInsets.only(left: 15.0, right: 15),
                  //           child: Text(
                  //             "NEXT",
                  //             style: TextStyle(
                  //                 color: ColorConstant.primaryWhiteColor,
                  //                 fontSize: 15,
                  //                 fontWeight: FontWeight.w500),
                  //           ),
                  //         ),
                  //       ),
                  //     )),
                  Positioned(
                      bottom: 10,
                      left: 20,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.black54,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return TeamPreviewPage();
                                  }));
                                },
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.remove_red_eye,
                                      size: 15,
                                      color: ColorConstant.primaryWhiteColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "PREVIEW",
                                      style: TextStyle(
                                          color:
                                              ColorConstant.primaryWhiteColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              widget.matches.elevenOut == 0
                                  ? Container()
                                  : const Text(
                                      "/",
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                              widget.matches.elevenOut == 0
                                  ? Container()
                                  : const SizedBox(
                                      width: 10,
                                    ),
                              widget.matches.elevenOut == 0
                                  ? Container()
                                  : Row(
                                      children: [
                                        Icon(
                                          Icons.remove_red_eye,
                                          size: 15,
                                          color:
                                              ColorConstant.primaryWhiteColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "LINEUP",
                                          style: TextStyle(
                                              color: ColorConstant
                                                  .primaryWhiteColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                      bottom: 10,
                      right: 20,
                      child: GetBuilder<HomeController>(
                          init: HomeController(),
                          builder: (controller) {
                            return InkWell(
                              onTap: () {
                                if (widget.isForEdit == false &&
                                    vcIndex != -1 &&
                                    captainIndex != -1) {
                                  controller.saveTeam(
                                      maches: widget.matches,
                                      contest: widget.contest,
                                      context: context,
                                      myTeamID: widget.myTeamId);
                                } else {
                                  print(widget.myTeamId);
                                  //debugger();
                                  controller.saveTeam(
                                    maches: widget.matches,
                                    contest: widget.contest,
                                    context: context,
                                    myTeamID: widget.myTeamId,
                                  );
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 70,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color:
                                      controller.choosedPlayerList.length >= 11
                                          ? Colors.black54
                                          : Colors.black12,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0, right: 0),
                                  child: Text(
                                    "NEXT",
                                    style: TextStyle(
                                        color: ColorConstant.primaryWhiteColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            );
                          })),
                ],
              );
            }),
      ),
    );
  }
}
