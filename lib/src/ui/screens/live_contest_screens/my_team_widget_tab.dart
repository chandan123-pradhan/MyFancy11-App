import 'dart:developer';

import 'package:cricket_fantacy/src/controllers/live_contest_controller.dart';
import 'package:cricket_fantacy/src/models/my_contest_api_response.dart';
import 'package:cricket_fantacy/src/ui/screens/live_contest_screens/live_team_preview.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MyTeamWidgetTab extends StatefulWidget {
  @override
  State<MyTeamWidgetTab> createState() => _MyTeamWidgetTabState();
}

class _MyTeamWidgetTabState extends State<MyTeamWidgetTab> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveContestController>(
        init: LiveContestController(),
        builder: (controller) {
          return controller.getMyTeamApiResponse == null
              ? shimerEffect(length: 3, context: context)
              : 
              
              ListView.builder(
                  itemCount: controller.getMyTeamApiResponse!.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: InkWell(
                        onTap: (){
                        var id=controller.getMyTeamApiResponse!.data[index].teamid;
                        //debugger();
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return LiveTeamPreview(teamID: controller.getMyTeamApiResponse!.data[index].teamid,
                            
                            flag: false,
                            userId: controller.getMyTeamApiResponse!.data[index].userId,
                            );
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            // color: ColorConstant.primaryWhiteColor,
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
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                            //  height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image:
                                        AssetImage(ImageUitls.team_preview_image),
                                    fit: BoxFit.fill),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    color: Colors.black12,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  controller.getMyTeamApiResponse!
                                                      .data[index].name,
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .primaryWhiteColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "(T${index + 1})",
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .primaryWhiteColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        // Padding(
                                        //   padding:
                                        //       const EdgeInsets.only(right: 10.0),
                                        //   child: Icon(
                                        //     Icons.share,
                                        //     size: 20,
                                        //     color:
                                        //         ColorConstant.primaryWhiteColor,
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Points",
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .primaryWhiteColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              controller.getMyTeamApiResponse!
                                                  .data[index].captain.points,
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .primaryWhiteColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                      Row(
                        children: [
                                            Container(
                                          // height: 60,
                                          // width: 100,
                                          child: Stack(
                                            children: [
                                              Column(
                                                children: [
                                                  Image.network(
                                                    controller
                                                        .getMyTeamApiResponse!
                                                        .data[index]
                                                        .captain
                                                        .image,
                                                    height: 50,
                                                    //  width: 100,
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    //  height: 10,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                2)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 2, bottom: 2),
                                                      child: Text(
                                                        controller
                                                            .getMyTeamApiResponse!
                                                            .data[index]
                                                            .captain
                                                            .name,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 7),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            
                                            ,Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black
                      ,
                      border:Border.all(width: 1,color: Colors.white)
                                                ),
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: Text("C",
                                                  style: TextStyle(
                                                    color: Colors.white,fontSize: 12
                                                  ),
                                                  ),
                                                ),
                                              ),
                                            )
                                            
                                            ],
                                          ),
                                        )
                               
                            ,   SizedBox(width: 40,)
                                 , 
                                     Container(
                                          // height: 60,
                                          // width: 100,
                                          child: Stack(
                                            children: [
                                              Column(
                                                children: [
                                                  Image.network(
                                                    controller
                                                        .getMyTeamApiResponse!
                                                        .data[index]
                                                        .viceCaptain
                                                        .image,
                                                    height: 50,
                                                    //  width: 100,
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    //  height: 10,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                2)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 2, bottom: 2),
                                                      child: Text(
                                                        controller
                                                            .getMyTeamApiResponse!
                                                            .data[index]
                                                            .viceCaptain
                                                            .name,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 7),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            
                                            ,Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black
                      ,
                      border:Border.all(width: 1,color: Colors.white)
                                                ),
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: Text("VC",
                                                  style: TextStyle(
                                                    color: Colors.white,fontSize: 8
                                                  ),
                                                  ),
                                                ),
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
                             
                             
                                                             Container(
                                    height: 30,
                                    color: Colors.black12,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10,right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                       
                                       Row(
                                        children: [
                                          Text("WK  ",
                                          style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
                                          ),
                                          ),
                                            Text(controller.getMyTeamApiResponse!.data[index].wk.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
                                          ),
                                          )
                                        ],
                                       ),
                      
                       Row(
                                        children: [
                                          Text("BAT  ",
                                          style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
                                          ),
                                          ),
                                            Text(controller.getMyTeamApiResponse!.data[index].bat.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
                                          ),
                                          )
                                        ],
                                       ),
                      
                       Row(
                                        children: [
                                          Text("AR  ",
                                          style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
                                          ),
                                          ),
                                            Text(controller.getMyTeamApiResponse!.data[index].all.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
                                          ),
                                          )
                                        ],
                                       ),
                      
                                        Row(
                                        children: [
                                          Text("BOWL  ",
                                          style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
                                          ),
                                          ),
                                            Text(controller.getMyTeamApiResponse!.data[index].bow.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
                                          ),
                                          )
                                        ],
                                       )
                      
                      
                      
                                                                  ]),
                                    )
                                  ),
                            
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
       
       
       
        });
  }
}
