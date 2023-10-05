import 'dart:developer';

import 'package:cricket_fantacy/src/controllers/live_contest_controller.dart';
import 'package:cricket_fantacy/src/models/my_contest_api_response.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MyContestTab extends StatefulWidget {
  @override
  State<MyContestTab> createState() => _MyContestTabState();
}

class _MyContestTabState extends State<MyContestTab> {
var controller=Get.put(LiveContestController());




@override
  void dispose() {
    
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveContestController>(
        init: LiveContestController(),
        builder: (controller) {
          return controller.myContestApiResponse == null
              ? shimerEffect(length: 3, context: context)
              : ListView.builder(
                  itemCount: controller.myContestApiResponse!.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: InkWell(
                        onTap: () {
                          var v=controller
                              .myContestApiResponse!.data[index].contestId;
                              print(v);
                          //    debugger();
                          controller.updateMycontestScreen(controller
                              .myContestApiResponse!.data[index].contestId
                              .toString());
                        },
                        child: Container(
                       //   height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            color: ColorConstant.primaryWhiteColor,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width / 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.myContestApiResponse!
                                            .data[index].contestName,
                                        style: TextStyle(
                                            color:
                                                ColorConstant.primaryBlackColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "${controller.myContestApiResponse!.data[index].totalTeam} Spots",
                                        style: TextStyle(
                                            color:
                                                ColorConstant.primaryBlackColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 35,
                               decoration: BoxDecoration(
                                 color: Colors.black12,
                                 borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                                 )
                               ),
                                width: MediaQuery.of(context).size.width / 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                "assets/new_icons/winner_not.png",
                                                height: 15,
                                                width: 15,
                                              ),
                                              // Icon(Icons.first)

                                              SizedBox(
                                                width: 5,
                                              ),

                                              Text(
                                                "₹" +
                                                    controller
                                                        .myContestApiResponse!
                                                        .data[index]
                                                        .firstPrize,
                                                style: TextStyle(
                                                    color: ColorConstant
                                                        .primaryBlackColor,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              // Image.asset(
                                              //   'assets/new_icons/trophy.png',
                                              //   height: 11,
                                              //   width: 11,
                                              // ),
                                              Container(
                                                width: 5,
                                                height: 5,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black26
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              // Icon(Icons.first)
                                              Text(
                                             "Max. Winners:- "+   controller
                                                        .myContestApiResponse!
                                                        .data[index]
                                                        .winPercent,
                                                    
                                                style: TextStyle(
                                                    color: ColorConstant
                                                        .primaryBlackColor,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Icon(
                                            Icons.check_circle_outline_sharp,
                                            size: 18,
                                            color: Colors.black54,
                                          ),
                                          // Icon(Icons.first)
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Guaranted!",
                                            style: TextStyle(
                                                color: ColorConstant
                                                    .primaryBlackColor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Expanded(
                              //     child: Container(
                              //   decoration: BoxDecoration(
                              //       color: Colors.amber[50],
                              //       borderRadius: BorderRadius.only(
                              //           bottomLeft: Radius.circular(10),
                              //           bottomRight: Radius.circular(10))),
                              //   child: Padding(
                              //     padding:
                              //         const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              //     child:
                                     
                              //         Row(
                              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //           children: [
                              //              Text(
                              //              'Rank',
                              //               style: TextStyle(
                              //                   color: Colors.black, fontSize: 15),
                              //             ),
                              //             Text(
                              //               controller.myContestApiResponse!
                              //                           .data[index].rank ==
                              //                       'null'
                              //                   ? '-'
                              //                   : controller.myContestApiResponse!
                              //                       .data[index].rank,
                              //               style: TextStyle(
                              //                   color: Colors.black, fontSize: 15),
                              //             ),
                              //           ],
                                      
                                    
                              //     ),
                              //   ),
                              // ))
                          
                          
                          
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
        });
  }
}
