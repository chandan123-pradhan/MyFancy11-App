import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/models/get_my_mateches_api_response.dart';
import 'package:cricket_fantacy/src/ui/screens/prediction_screens/prediction_home_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class MyUpcommingMatchCardWidget extends StatefulWidget {
  final MyMatchModel matches;
  final Matches machesmodel;
  MyUpcommingMatchCardWidget({required this.matches,required this.machesmodel});

  @override
  State<MyUpcommingMatchCardWidget> createState() =>
      _MyUpcommingMatchCardWidgetState();
}

class _MyUpcommingMatchCardWidgetState
    extends State<MyUpcommingMatchCardWidget> {
  var targetDate;
  Duration? remainingDuration;
  _calculateTimeRemaining() {
    DateTime now = DateTime.now();
    targetDate =
        DateFormat("yyyy-MM-dd hh:mm:ss").parse(widget.matches.matchDateTime);
    remainingDuration = targetDate.difference(now);

    int hours = remainingDuration!.inHours;
    int minutes = remainingDuration!.inMinutes.remainder(60);
    print('$hours hours and $minutes minutes remaining');
    //return '';
    setState(() {});
  }

  @override
  void initState() {
    _calculateTimeRemaining();
    // TODO: implement initState
    super.initState();
  }

  bool isSetReminder = false;
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: 
            Container(
              height: 190,
              child: Stack(
                children: [
                  // Positioned(
                  //     bottom: 0,
                  //     right: 0,
                  //     child:

                  //     ),
                  Positioned(
                    top: 1,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        if (logInStatus) {
                          
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PredictionHomePage(

                              matches: widget.machesmodel,
                            );
                          }));
                        } else {
                          Messages().showErrorMsg(
                              context: context,
                              message:
                                  'You have Not Loggedin, Please Login first');
                        }
                      },
                      child: Container(
                        width: 130,
                        height: 30,
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                            )),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/lotties/prediction_animation.json',
                            height: 18,
                            width: 18
                            ),
                            SizedBox(width: 5,),
                            const Text(
                              "Prediction",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(2)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        color: ColorConstant.primaryWhiteColor,
                        //  color: ColorConstant.primaryWhiteColor,
                        image: const DecorationImage(
                            image: AssetImage(
                                "assets/images/upcoming_match_bg.png"),
                            fit: BoxFit.fill),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 5, right: 10, bottom: 0),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: 0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.matches.leagueName,
                                        style: TextStyle(
                                            color:
                                                ColorConstant.primaryBlackColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    
                                                        Image.asset(
                                                         widget.matches
                                                                      .elevenOut ==
                                                                  '0'
                                                              ? "assets/new_icons/lineup_not.png"
                                                              : "assets/new_icons/lineup.png",
                                                          height: 20,
                                                          width: 20,
                                                        ),

                                                        //  InkWell(
                                                        //       onTap: () {
                                                        //         //                                       (WidgetsBinding.instance).addPostFrameCallback(
                                                        //         //   (_) => ShowCaseWidget.of(context)
                                                        //         //       .startShowCase([_one]),
                                                        //         // );
                                                        //       },
                                                        //       child: Image.asset(
                                                        //         widget.matches.elevenOut == 0?
                                                        //         "assets/new_icons/lineup_not.png":
                                                        //         "assets/new_icons/lineup.png",
                                                        //       height: 20,
                                                        //       width: 20,

                                                        //       )

                                                        //       // Text(
                                                        //       //   widget.matches.elevenOut == 0
                                                        //       //       ? 'Linupout not available'
                                                        //       //       : 'Linup out',
                                                        //       //   style: TextStyle(
                                                        //       //       color: widget.matches.elevenOut ==
                                                        //       //               0
                                                        //       //           ? Colors.black38
                                                        //       //           : ColorConstant.greenColor,
                                                        //       //       fontSize: 12,
                                                        //       //       fontWeight: FontWeight.w500),
                                                        //       // ),

                                                        //   )
                                                   
                                              
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(widget
                                                        .matches
                                                        .team1
                                                        .teamImage),
                                                    fit: BoxFit.fill)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            widget.matches.team1.teamShortName,
                                            style: TextStyle(
                                                color: ColorConstant
                                                    .primaryBlackColor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                              height: 25,
                                              // width: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.deepOrange[50]),
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 0, 10, 0),
                                                child: CountdownTimer(
                                                  endWidget: Text("Live"),
                                                  endTime: targetDate
                                                      .millisecondsSinceEpoch,
                                                  textStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            widget.matches.matchDateTime,
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            widget.matches.team2.teamShortName,
                                            style: TextStyle(
                                                color: ColorConstant
                                                    .primaryBlackColor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(widget
                                                        .matches
                                                        .team2
                                                        .teamImage),
                                                    fit: BoxFit.fill)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 10, 0),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            widget.matches.team1.teamName,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            widget.matches.team2.teamName,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.orange[50],
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.orange)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
  widget
                                              .matches.mega=='0'?'Mega Coming Soon':     
                                          
                                            "Mega ₹${widget
                                              .matches.mega}",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.setReminder(widget
                                              .matches.matchId
                                              .toString(),
                                              context);
                                          setState(() {
                                            isSetReminder = true;
                                          });
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 30,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color:  widget.matches
                                                              .is_subscribe ==
                                                          '1' ||
                                                      isSetReminder == true
                                                  ? ColorConstant.primaryColor
                                                  : Colors.white,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.black26)),
                                          child: Image.asset(
                                            ImageUitls.Notification_icon,
                                            height: 15,
                                            width: 15,
                                            color:
                                                widget.matches.is_subscribe ==
                                                            '1' ||
                                                        isSetReminder == true
                                                    ? Colors.white
                                                    : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //  SizedBox(height: ,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
           
          
        
      );
    
    
    // Container(
    //   width: MediaQuery.of(context).size.width / 1,
    //   height: 160,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.grey.withOpacity(0.3),
    //         spreadRadius: 2,
    //         blurRadius: 2,
    //         offset: Offset(0, 1), // changes position of shadow
    //       ),
    //     ],
    //     color: ColorConstant.primaryWhiteColor,

    //     //  color: ColorConstant.primaryWhiteColor,
    //     image: const DecorationImage(
    //         image: AssetImage("assets/images/upcoming_match_bg.png"),
    //         fit: BoxFit.fill),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.all(0.0),
    //     child: Padding(
    //       padding:
    //           const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 0),
    //       child: Stack(
    //         children: [
    //           Column(
    //             children: [
    //               SizedBox(height: 0),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     widget.matches.leagueName,
    //                     style: TextStyle(
    //                         color: ColorConstant.primaryBlackColor,
    //                         fontSize: 13,
    //                         fontWeight: FontWeight.w600),
    //                   ),
    //                   Row(
    //                     children: [
    //                       Row(
    //                         children: [
    //                           Image.asset(
    //                             widget.matches.elevenOut == '0'
    //                                 ? "assets/new_icons/lineup_not.png"
    //                                 : "assets/new_icons/lineup.png",
    //                             height: 20,
    //                             width: 20,
    //                           )
    //                         ],
    //                       ),
    //                     ],
    //                   )
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 15,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       Container(
    //                         height: 35,
    //                         width: 35,
    //                         decoration: BoxDecoration(
    //                             shape: BoxShape.circle,
    //                             image: DecorationImage(
    //                                 image: NetworkImage(
    //                                     widget.matches.team1.teamImage),
    //                                 fit: BoxFit.fill)),
    //                       ),
    //                       const SizedBox(
    //                         width: 10,
    //                       ),
    //                       Text(
    //                         widget.matches.team1.teamShortName,
    //                         style: TextStyle(
    //                             color: ColorConstant.primaryBlackColor,
    //                             fontSize: 13,
    //                             fontWeight: FontWeight.w600),
    //                       ),
    //                     ],
    //                   ),
    //                   Column(
    //                     children: [
    //                       SizedBox(
    //                         height: 15,
    //                       ),
    //                       Container(
    //                           height: 25,
    //                           // width: 80,
    //                           decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(5),
    //                               color: Colors.deepOrange[50]),
    //                           alignment: Alignment.center,
    //                           child: Padding(
    //                             padding:
    //                                 const EdgeInsets.fromLTRB(10, 0, 10, 0),
    //                             child: CountdownTimer(
    //                               endWidget: remainingDuration!.inHours < 0
    //                                   ? Text("Completed")
    //                                   : Text("Live"),
    //                               endTime: targetDate.millisecondsSinceEpoch,
    //                               textStyle: TextStyle(
    //                                   fontSize: 12,
    //                                   color: Colors.red,
    //                                   fontWeight: FontWeight.w600),
    //                             ),
    //                           )),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Text(
    //                         widget.matches.matchDateTime,
    //                         style: TextStyle(
    //                             color: Colors.black45,
    //                             fontSize: 11,
    //                             fontWeight: FontWeight.w400),
    //                       ),
    //                     ],
    //                   ),
    //                   Row(
    //                     children: [
    //                       Text(
    //                         widget.matches.team2.teamShortName,
    //                         style: TextStyle(
    //                             color: ColorConstant.primaryBlackColor,
    //                             fontSize: 13,
    //                             fontWeight: FontWeight.w600),
    //                       ),
    //                       SizedBox(
    //                         width: 10,
    //                       ),
    //                       Container(
    //                         height: 35,
    //                         width: 35,
    //                         decoration: BoxDecoration(
    //                             shape: BoxShape.circle,
    //                             image: DecorationImage(
    //                                 image: NetworkImage(
    //                                     widget.matches.team2.teamImage),
    //                                 fit: BoxFit.fill)),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
    //                 child: Container(
    //                   alignment: Alignment.centerLeft,
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Text(
    //                         widget.matches.team1.teamName,
    //                         style: TextStyle(
    //                             color: Colors.black54,
    //                             fontSize: 12,
    //                             fontWeight: FontWeight.w400),
    //                       ),
    //                       Text(
    //                         widget.matches.team2.teamName,
    //                         style: TextStyle(
    //                             color: Colors.black54,
    //                             fontSize: 12,
    //                             fontWeight: FontWeight.w400),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),
    //           Positioned(
    //             bottom: 0,
    //             left: 0,
    //             right: 0,
    //             child: Padding(
    //               padding: const EdgeInsets.fromLTRB(0, 5, 0, 4),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Container(
    //                     alignment: Alignment.center,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(5),
    //                         color: Colors.orange[50],
    //                         border: Border.all(width: 1, color: Colors.orange)),
    //                     child: Padding(
    //                       padding: const EdgeInsets.all(5.0),
    //                       child: Text(
    //                         "Mega Rs.1.5 Lacks",
    //                         style: TextStyle(
    //                             color: Colors.black45,
    //                             fontSize: 12,
    //                             fontWeight: FontWeight.w500),
    //                       ),
    //                     ),
    //                   ),
    //                   InkWell(
    //                     onTap: () {
    //                       controller
    //                           .setReminder(widget.matches.matchId.toString());
    //                       setState(() {
    //                         isSetReminder = true;
    //                       });
    //                     },
    //                     child: Container(
    //                       height: 25,
    //                       width: 30,
    //                       alignment: Alignment.center,
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(10),
    //                           color: widget.matches.is_subscribe == '1' ||
    //                                   isSetReminder == true
    //                               ? ColorConstant.primaryColor
    //                               : Colors.white,
    //                           border:
    //                               Border.all(width: 1, color: Colors.black26)),
    //                       child: Image.asset(
    //                         ImageUitls.Notification_icon,
    //                         height: 15,
    //                         width: 15,
    //                         color: widget.matches.is_subscribe == '1' ||
    //                                 isSetReminder == true
    //                             ? Colors.white
    //                             : Colors.black,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //     //  SizedBox(height: ,),
    //   ),
    // );
  
  
  }
}
