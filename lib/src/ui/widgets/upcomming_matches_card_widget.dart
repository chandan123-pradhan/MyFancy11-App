import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/ui/screens/prediction_screens/prediction_home_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:lottie/lottie.dart';
import 'package:showcaseview/showcaseview.dart';

class UpcommingMatchCardWidget extends StatefulWidget {
  final Matches matches;
  UpcommingMatchCardWidget({required this.matches});

  @override
  State<UpcommingMatchCardWidget> createState() =>
      _UpcommingMatchCardWidgetState();
}

class _UpcommingMatchCardWidgetState extends State<UpcommingMatchCardWidget> {
  bool isSetReminder = false;

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

  var controller = Get.put(HomeController());
  GlobalKey _one = GlobalKey();
  @override
  void initState() {
    _calculateTimeRemaining();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  
    
    
    Container(
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
                              matches: widget.matches,
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
                              bottomRight: Radius.circular(0)
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
                          topRight: Radius.circular(3)
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
                              left: 10, top: 5, right: 0, bottom: 0),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: 0),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.matches.leagueName,
                                          style: TextStyle(
                                              color:
                                                  ColorConstant.primaryBlackColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Expanded(
                                            
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      // Icon(
                                                      //   Icons.live_tv_sharp,
                                                      //   size: 18,
                                                      //   color: Colors.black38,
                                                      // ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            widget.matches
                                                                        .elevenOut ==
                                                                    0
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
                                                      )
                                                    ],
                                                  ),
                                                )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:10.0),
                                    child: Row(
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
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.setReminder(widget
                                                  .matches.matchId
                                                  .toString(),context);
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
                                                  color: widget.matches
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
                             widget.matches.freeGiveway=='0'?SizedBox(width: 10,):        SizedBox(width: 20,),
                                  widget.matches.freeGiveway=='0'?Container():     Container(
                                     // height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topLeft: Radius.circular(10)
                                        ),
                                      color: ColorConstant.primaryColor
                                      ),
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(12,6,12,8),
                                        child: Row(
                                          children: [
                                            Image.asset('assets/icons/gift.png',
                                            height: 10,
                                            width: 10,
                                            ),

                                            Text("  ₹ ${widget.matches.freeGiveway}",
                                            style: TextStyle(
                                              color: ColorConstant.primaryWhiteColor,
                                              fontSize: 12,fontWeight: FontWeight.w500
                                            ),
                                            )
                                          ],
                                        ),
                                      ),
                                     )
                                     
                                        ],
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
    
  }
}




/**
 * 1- facebook login
 * 2- registeration faild issue.
 * 3- i agree all Terms & Login and privacy polic with hyper link.- done
 * 4- on login page back bottom sending out of the application.- done.
 * 5- instread of showing not logged in send it to login page.- done.
 * 6- registration proifle pic.:- DONE.
 * 7- google login fail then disable loader.:- done
 * 7- validate terms and condition during google as well.:done.
 * 8- in quiz section login condition not checking.:- done.
 * 9- in quiz section when amount will be zero then user shouldn't able to tape on buy botton.-done
 * 10- true and falce should be change on quiz details page.- pending for now.
 * 11- prediction card should be same like previous.- done.
 * 12- login check in notififation and wallet icon.- done.
 * 13- slider bullet number wrong.-done
 * 14- login banner and home page place holder image issue.- done.
 * 15- login page banner description is wrong.- done
 * 16- in side bar items next icon will remove.- done
 * 17- remove linetext and use avaialable.- DONE.
 * 18- increase icon botton touch area like notification and wallet.-done
 * 19- replace snackbar to tost msg.-done
 * 20- use tool tip on lineup icon and mega contest body on home.-pending
 * 21- on first price use tool tip and wining pertage and guaranteed on contest list page.-pending
 * 22- spots left prograss not working on contest list.- done
 * 23- preview and lineup botton little bit fade.-done
 * 23- when lineup not available then remove or hide lineup text in pick player.-done
 * 24- remove VKT and add WK.-done
 * 25- select wicket keepr, select batsman...etc.-done
 * 26- remove filter icon in pick screen.-done
 * 27- remove avg scroe 129 text, pitch balaned, and this section and add vanue only.- done
 * 28- remove edit icon from points text and remove download icon from credit text.-done
 * 29- completed matches country image not in circular.-done
 * 30- remove notification icon from completed and live.-done
 * 31- remove lineup section from live and completed.-done
 * 32- next bottom not disable during uncheck terms on login page.-done
 * 33- portfolio instead of quiz.-done.
 * 34- remove under line from developed by text from drawer:- done.
 * 35- add money botton shoud be same like dream11:- done.
 * 36- 
 */