import 'dart:async';
import 'dart:developer';

import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/ui/screens/live_contest_screens/live_team_preview.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:cricket_fantacy/src/utils/local_storage/shared_prefrences.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class LeaderboardTab extends StatefulWidget {
  String contestId;
  String matchStatus;
  bool flag;
  bool isForLive;
  LeaderboardTab({required this.contestId, required this.matchStatus,required this.flag,required this.isForLive});

  @override
  State<LeaderboardTab> createState() => _LeaderboardTabState();
}

class _LeaderboardTabState extends State<LeaderboardTab> {
  var controller = Get.put(HomeController());

  @override
  void initState() {
    getAuthToken();
    controller.getLeaderBoardResponse(context, widget.contestId);
   if(widget.flag==false){
     updateLive();
   }
    // TODO: implement initState
    super.initState();
  }

  String? appToken;
  SharedPref sharedPref = SharedPref();
  getAuthToken() async {
    appToken = await sharedPref.getUserToken();
    // debugger();
  }

Timer? _t;
void updateLive(){
  _t=Timer.periodic((Duration(seconds: 5)), (timer) { 
    controller.getLeaderBoardResponse(context, widget.contestId);
  });
}

@override
  void dispose() {

    if(_t!=null){
      _t!.cancel();
    }
    print("leaderboard timer cancle");
    controller.getLeaderboardApiResponse = null;
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
        onRefresh: () async {
     controller.getLeaderBoardResponse(context, widget.contestId);
        },
      
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return controller.getLeaderboardApiResponse == null
                ? shimerEffect(length: 3, context: context)
                : Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Visibility
                      (
                        visible: !widget.isForLive,
                        child: Container(
                          height: 40,
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Be the first in your network to join this contest",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                      //  Divider(),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.black12),
                                top:
                                    BorderSide(width: 1, color: Colors.black12))),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "All Teams (${controller.getLeaderboardApiResponse!.data.length})",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                child: Text(
                                  "PLAYER",
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                alignment: Alignment.center,
                                child: Text(
                                  "Team Name",
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 5,
                                alignment: Alignment.center,
                                child: Text(
                            widget.flag==true?'Win':      "POINT",
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 5,
                                alignment: Alignment.center,
                                child: Text(
                                  "RANK",
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: controller
                                  .getLeaderboardApiResponse!.data.isEmpty
                              ? Center(
                                  child: Text("Leaderboard data not found"),
                                )
                              : SingleChildScrollView(
                                  physics: AlwaysScrollableScrollPhysics(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        for (int i = 0;
                                            i <
                                                controller
                                                    .getLeaderboardApiResponse!
                                                    .data
                                                    .length;
                                            i++)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: InkWell(
                                              onTap: () {
                                                if (widget.matchStatus ==
                                                        'live' ||
                                                    controller
                                                            .getLeaderboardApiResponse!
                                                            .data[i]
                                                            .userId ==
                                                        appToken) {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return LiveTeamPreview(
                                                      teamID: controller
                                                          .getLeaderboardApiResponse!
                                                          .data[i]
                                                          .teamid,
                                                      userId: controller
                                                          .getLeaderboardApiResponse!
                                                          .data[i]
                                                          .userId,
                                                      flag: true,
                                                    );
                                                  }));
                                                } else {
                                                  Messages().showErrorMsg(
                                                      context: context,
                                                      message:
                                                          'Match is not live');
                                                }
                                              },
                                              child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: controller
                                                              .getLeaderboardApiResponse!
                                                              .data[i]
                                                              .userId ==
                                                          appToken
                                                      ? ColorConstant.greenColor
                                                      : Colors.orange[300],
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                4,
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height: 35,
                                                              width: 35,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  image: DecorationImage(
                                                                      image: NetworkImage(controller
                                                                          .getLeaderboardApiResponse!
                                                                          .data[i]
                                                                          .profile),
                                                                      fit: BoxFit
                                                                          .fill)),
                                                            ),
                                                            SizedBox(
                                                              width: 4,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                controller
                                                                    .getLeaderboardApiResponse!
                                                                    .data[i]
                                                                    .name,
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color: ColorConstant
                                                                        .primaryWhiteColor,
                                                                    fontSize: 14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                7,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "T" +
                                                              controller
                                                                  .getLeaderboardApiResponse!
                                                                  .data[i]
                                                                  .TeamName,
                                                          style: TextStyle(
                                                              color: ColorConstant
                                                                  .primaryWhiteColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                      Container(
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                6,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                   widget.flag==true? 
                                                   
                                                    "₹"+  controller
                                                              .getLeaderboardApiResponse!
                                                              .data[i].winAmount:
                                                         controller
                                                              .getLeaderboardApiResponse!
                                                              .data[i]
                                                              .points,
                                                          style: TextStyle(
                                                              color: ColorConstant
                                                                  .primaryWhiteColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    
                                                    
                      controller
                                                              .getLeaderboardApiResponse!
                                                              .data[i]
                                                              .userId ==
                                                          appToken && widget.flag==true ?
                                                          
                                                                                          Container(
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                6,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            Text(
                                                              controller
                                                                  .getLeaderboardApiResponse!
                                                                  .data[i]
                                                                  .rank,
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .primaryWhiteColor,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            SizedBox(width: 10,),
                                                        
                                                        
                                                            InkWell(
                                                              onTap: (){
                                                                                                      Share.share(
                                          // '$refferAndEarnMsg\n${controller.refferalApiResponse!.refer.refercode}');

                                     'Hey, I am ${controller.getLeaderboardApiResponse!.data[i].name},\nI have Earned ₹${controller
                                                                  .getLeaderboardApiResponse!
                                                                  .data[i]
                                                                  .winAmount} amount by joining Live matches from Myfancy11 App.'
                                     );
                                 
                                                            },
                                                              child: Icon(Icons.share,size:15,color: Colors.white,))
                                                         , SizedBox(width: 5,),
                                                          ],
                                                        ),
                                                      )
                                                 
                                                 :                                Container(
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                6,
                                                        alignment:
                                                            Alignment.center,
                                                        child:
                                                            Text(
                                                              controller
                                                                  .getLeaderboardApiResponse!
                                                                  .data[i]
                                                                  .rank,
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .primaryWhiteColor,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          
                                                      )
                                                    
                                                 
                                                    ],
                                                  ),
                                                ),
    
                                                // height: 40,
                                                // child: Padding(
                                                //   padding: const EdgeInsets.only(
                                                //       left: 15.0, right: 15),
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment.spaceBetween,
    
                                                //     children: [
                                                // Container(
                                                //   height: 35,
                                                //   width: 35,
                                                //   decoration: BoxDecoration(
                                                //       shape: BoxShape.circle,
                                                //       image: DecorationImage(
                                                //           image: NetworkImage(
                                                //               controller
                                                //                   .getLeaderboardApiResponse!
                                                //                   .data[i]
                                                //                   .profile),
                                                //           fit: BoxFit.fill)),
                                                // ),
                                                //       SizedBox(
                                                //         width: 20,
                                                //       ),
                                                //       Padding(
                                                //         padding: EdgeInsets.fromLTRB(
                                                //             0, 10, 0, 10),
                                                //         child: Row(
                                                //           crossAxisAlignment:
                                                //               CrossAxisAlignment.start,
    
                                                //           children: [
    
                                                //                 Text(
                                                // controller
                                                //     .getLeaderboardApiResponse!
                                                //     .data[i]
                                                //     .name,
                                                //                   style: TextStyle(
                                                //                       fontSize: 16,
                                                //                       fontWeight:
                                                //                           FontWeight
                                                //                               .w500,
                                                //                       color: ColorConstant
                                                //                           .primaryWhiteColor),
                                                //                 ),
    
                                                //             SizedBox(
                                                //               height: 5,
                                                //             ),
                                                //             Row(
                                                //               children: [
                                                //                 Text(
                                                //                   "Team:- ",
                                                //                   style: TextStyle(
                                                //                       fontSize: 12,
                                                //                       fontWeight:
                                                //                           FontWeight.w500,
                                                //                       color: Colors.black45
                                                //                           ),
                                                //                 ),
                                                //                 Text(
    
                                                // controller
                                                //     .getLeaderboardApiResponse!
                                                //     .data[i]
                                                //     .TeamName,
                                                //                   style: TextStyle(
                                                //                       fontSize: 12,
                                                //                       fontWeight:
                                                //                           FontWeight.w500,
                                                //                       color: ColorConstant
                                                //                           .primaryBlackColor),
                                                //                 ),
                                                //               ],
                                                //             ),
                                                //             SizedBox(
                                                //               height: 5,
                                                //             ),
                                                //               Row(
                                                //               children: [
                                                //                 Text(
                                                //                   "Points:- ",
                                                //                   style: TextStyle(
                                                //                       fontSize: 12,
                                                //                       fontWeight:
                                                //                           FontWeight.w500,
                                                //                       color: Colors.black45
                                                //                           ),
                                                //                 ),
                                                //                 Text(
    
                                                // controller
                                                //     .getLeaderboardApiResponse!
                                                //     .data[i]
                                                //     .points,
                                                //                   style: TextStyle(
                                                //                       fontSize: 12,
                                                //                       fontWeight:
                                                //                           FontWeight.w500,
                                                //                       color: ColorConstant
                                                //                           .primaryBlackColor),
                                                //                 ),
                                                //               ],
                                                //             ),
                                                //             // Text(
                                                //             //   "Points:- " +
                                                //             //       controller
                                                //             //           .getLeaderboardApiResponse!
                                                //             //           .data[i]
                                                //             //           .points,
                                                //             //   style: TextStyle(
                                                //             //       fontSize: 12,
                                                //             //       fontWeight:
                                                //             //           FontWeight.w500,
                                                //             //       color: ColorConstant
                                                //             //           .primaryBlackColor),
                                                //             // ),
                                                //           ],
                                                //         ),
                                                //       ),
                                                //  ],
                                                // ),
                                                //  ),
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ))
                    ],
                  );
          }),
    );
  }
}
