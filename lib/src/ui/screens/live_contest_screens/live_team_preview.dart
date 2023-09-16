import 'package:cricket_fantacy/src/controllers/live_contest_controller.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/models/get_my_player_api_response.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveTeamPreview extends StatefulWidget {
  String teamID;
  LiveTeamPreview({required this.teamID});

  @override
  State<LiveTeamPreview> createState() => _LiveTeamPreviewState();
}

class _LiveTeamPreviewState extends State<LiveTeamPreview> {
  var controller = Get.put(LiveContestController());

  @override
  void initState() {
    controller.getTeamPlayers(widget.teamID);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            elevation: 0,
            backgroundColor: ColorConstant.primaryBlackColor,
          )),
      body: GetBuilder<LiveContestController>(
          init: LiveContestController(),
          builder: (controller) {
            return Column(
              children: [
                // Container(
                //   height: 70,
                //   width: MediaQuery.of(context).size.width / 1,
                //   color: ColorConstant.primaryBlackColor,
                //   child: Padding(
                //     padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(
                //               "Players",
                //               style: TextStyle(
                //                   color: Colors.white54,
                //                   fontSize: 13,
                //                   fontWeight: FontWeight.w500),
                //             ),
                //             Text(
                //               "",
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 13,
                //                   fontWeight: FontWeight.w500),
                //             ),
                //           ],
                //         ),
                //         Row(
                //           children: [
                //             Container(
                //               height: 25,
                //               decoration: BoxDecoration(
                //                   color: ColorConstant.primaryWhiteColor,
                //                   borderRadius: BorderRadius.circular(5)),
                //               alignment: Alignment.center,
                //               child: Padding(
                //                 padding: const EdgeInsets.only(left: 10, right: 10),
                //                 child: Text(
                //                   "PBKS",
                //                   style: TextStyle(
                //                       color: ColorConstant.primaryBlackColor,
                //                       fontSize: 11,
                //                       fontWeight: FontWeight.w500),
                //                 ),
                //               ),
                //             ),
                //             SizedBox(
                //               width: 10,
                //             ),
                //             Text(
                //               "6",
                //               style: TextStyle(
                //                   color: ColorConstant.primaryWhiteColor,
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.w500),
                //             ),
                //             Text(
                //               " : ",
                //               style: TextStyle(
                //                   color: ColorConstant.primaryWhiteColor,
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.w500),
                //             ),
                //             Text(
                //               "5",
                //               style: TextStyle(
                //                   color: ColorConstant.primaryWhiteColor,
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.w500),
                //             ),
                //             SizedBox(
                //               width: 10,
                //             ),
                //             Container(
                //               height: 25,
                //               decoration: BoxDecoration(
                //                   color: ColorConstant.primaryBlackColor,
                //                   borderRadius: BorderRadius.circular(5)),
                //               alignment: Alignment.center,
                //               child: Padding(
                //                 padding: const EdgeInsets.only(left: 10, right: 10),
                //                 child: Text(
                //                   "RR",
                //                   style: TextStyle(
                //                       color: ColorConstant.primaryWhiteColor,
                //                       fontSize: 11,
                //                       fontWeight: FontWeight.w500),
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.end,
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(
                //               "Credit left",
                //               style: TextStyle(
                //                   color: Colors.white54,
                //                   fontSize: 13,
                //                   fontWeight: FontWeight.w500),
                //             ),
                //             Text(
                //               "2.0",
                //               style: TextStyle(
                //                   color: Co lors.white,
                //                   fontSize: 13,
                //                   fontWeight: FontWeight.w500),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                Expanded(
                  child: Container(
                    // height: MediaQuery.of(context).size.height/1,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: const BoxDecoration(
                      color: ColorConstant.green,
                      image: DecorationImage(
                          image: AssetImage(ImageUitls.team_preview_image),
                          fit: BoxFit.fill),
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: 10,
                          child: Text(
                            "WICKET KEEPERS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),

                        Positioned(
                          top: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              width: controller.wicketKeeperList.length > 4
                                  ? MediaQuery.of(context).size.width / 1.01
                                  : MediaQuery.of(context).size.width / 1.2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 0;
                                      i < controller.wicketKeeperList.length;
                                      i++)
                                    playerWidget(
                                       
                                       myPlayerData: controller.wicketKeeperList[i]
                                       ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //      Positioned(top: 40, right: 45, child: playerWidget()),

                        Positioned(
                          top: MediaQuery.of(context).size.height / 4,
                          child: Text(
                            "BATTER",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 3.5,
                          // left: 20,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              width: controller.batsmanData.length > 4
                                  ? MediaQuery.of(context).size.width / 1.01
                                  : MediaQuery.of(context).size.width / 1.2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 0;
                                      i < controller.batsmanData.length;
                                      i++)
                                    playerWidget(
                                       
                                       myPlayerData: controller.batsmanData[i]
                                       ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 1.95,
                          child: Text(
                            "ALL-ROUNDER",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 1.8,
                          // left: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              width: controller.allrounderList.length > 4
                                  ? MediaQuery.of(context).size.width / 1.01
                                  : MediaQuery.of(context).size.width / 1.2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 0;
                                      i < controller.allrounderList.length;
                                      i++)
                                    playerWidget(
                                       myPlayerData: controller.allrounderList[i]
                                       ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 1.38,
                          child: Text(
                            "BOWLERS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 1.3,
                          // left: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              width: controller.bowlerList.length > 4
                                  ? MediaQuery.of(context).size.width / 1.01
                                  : MediaQuery.of(context).size.width / 1.2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 0;
                                      i < controller.bowlerList.length;
                                      i++)
                                    playerWidget(
                                       myPlayerData: controller.bowlerList[i])
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget playerWidget(
      {required MyPlayerData myPlayerData}) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(myPlayerData.image), fit: BoxFit.fill)),
        ),
        Container(
          // width: 70,
          alignment: Alignment.center,
          color: ColorConstant.primaryBlackColor,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              myPlayerData.name,
              style: TextStyle(
                  color: ColorConstant.primaryWhiteColor, fontSize: 11),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
         
         "Point: "+ myPlayerData.totalPoints,
          style:
              TextStyle(color: ColorConstant.primaryWhiteColor, fontSize: 11),
        ),
      ],
    );
  }
}
