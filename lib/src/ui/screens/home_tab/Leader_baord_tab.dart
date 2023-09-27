import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class LeaderboardTab extends StatefulWidget {
  String contestId;
  LeaderboardTab({required this.contestId});

  @override
  State<LeaderboardTab> createState() => _LeaderboardTabState();
}

class _LeaderboardTabState extends State<LeaderboardTab> {
  var controller = Get.put(HomeController());

  @override
  void initState() {
    controller.getLeaderBoardResponse(context, widget.contestId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return controller.getLeaderboardApiResponse == null
              ? shimerEffect(length: 3, context: context)
              : Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
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

                    Expanded(
                        child: controller
                                .getLeaderboardApiResponse!.data.isEmpty
                            ? Center(
                                child: Text("Leaderboard data not found"),
                              )
                            : SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Column(
                                  children: [
                                    for (int i = 0;
                                        i <
                                            controller
                                                .getLeaderboardApiResponse!
                                                .data
                                                .length;
                                        i++)
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1,
                                                    color: Colors.black12))),
                                        // height: 40,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0, right: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            controller
                                                                .getLeaderboardApiResponse!
                                                                .data[i]
                                                                .profile),
                                                        fit: BoxFit.fill)),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 10, 0, 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Player Name:- ",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black45),
                                                        ),
                                                        Text(
                                                          controller
                                                              .getLeaderboardApiResponse!
                                                              .data[i]
                                                              .name,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: ColorConstant
                                                                  .primaryBlackColor),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Team:- ",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              color: Colors.black45
                                                                  ),
                                                        ),
                                                        Text(
                                                           
                                                              controller
                                                                  .getLeaderboardApiResponse!
                                                                  .data[i]
                                                                  .TeamName,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              color: ColorConstant
                                                                  .primaryBlackColor),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                      Row(
                                                      children: [
                                                        Text(
                                                          "Points:- ",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              color: Colors.black45
                                                                  ),
                                                        ),
                                                        Text(
                                                           
                                                              controller
                                                                  .getLeaderboardApiResponse!
                                                                  .data[i]
                                                                  .points,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              color: ColorConstant
                                                                  .primaryBlackColor),
                                                        ),
                                                      ],
                                                    ),
                                                    // Text(
                                                    //   "Points:- " +
                                                    //       controller
                                                    //           .getLeaderboardApiResponse!
                                                    //           .data[i]
                                                    //           .points,
                                                    //   style: TextStyle(
                                                    //       fontSize: 12,
                                                    //       fontWeight:
                                                    //           FontWeight.w500,
                                                    //       color: ColorConstant
                                                    //           .primaryBlackColor),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ))
                  ],
                );
        });
  }
}
