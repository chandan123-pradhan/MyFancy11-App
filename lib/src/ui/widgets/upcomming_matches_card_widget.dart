import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/ui/screens/prediction_screens/prediction_home_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:intl/intl.dart';

class UpcommingMatchCardWidget extends StatefulWidget {
  final Matches matches;
  UpcommingMatchCardWidget({required this.matches});

  @override
  State<UpcommingMatchCardWidget> createState() =>
      _UpcommingMatchCardWidgetState();
}

class _UpcommingMatchCardWidgetState extends State<UpcommingMatchCardWidget> {
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
  void initState() {
    _calculateTimeRemaining();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  PredictionHomePage(
                      matches: widget.matches,
                    );
                  }));
                },
                child: Container(
                  width: 130,
                  height: 20,
                  decoration: const BoxDecoration(
                      color: ColorConstant.primaryColor,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(15))),
                  alignment: Alignment.center,
                  child: const Text(
                    "Prediction",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width / 1,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
                    image: AssetImage("assets/images/upcoming_match_bg.png"),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.matches.leagueName,
                                style: TextStyle(
                                    color: ColorConstant.primaryBlackColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
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
                                            Icon(
                                              Icons.person_outlined,
                                              size: 15,
                                              color: Colors.black38,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Linup out',
                                              style: TextStyle(
                                                  color:
                                                  widget.matches.elevenOut==0?
                                                  
                                                   Colors.black38:
                                                       ColorConstant.greenColor,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                widget.matches.team1.teamImage),
                                            fit: BoxFit.fill)),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.matches.team1.teamShortName,
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
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
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: CountdownTimer(
                                          endWidget: Text("Live"),
                                          endTime:
                                              targetDate.millisecondsSinceEpoch,
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w600),
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
                                        color: ColorConstant.primaryBlackColor,
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
                                            image: NetworkImage(
                                                widget.matches.team2.teamImage),
                                            fit: BoxFit.fill)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
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
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.orange[50],
                                    border: Border.all(
                                        width: 1, color: Colors.orange)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Mega Rs.1.5 Lacks",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Container(
                                height: 25,
                                width: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.black26)),
                                child: Image.asset(
                                  ImageUitls.Notification_icon,
                                  height: 15,
                                  width: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //  SizedBox(height: ,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
