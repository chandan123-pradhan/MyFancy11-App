import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/models/get_my_mateches_api_response.dart';
import 'package:cricket_fantacy/src/ui/screens/live_contest_screens/live_contest_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CurrentMatchCardWidget extends StatefulWidget {
  final MyMatchModel myMatchModel;

  CurrentMatchCardWidget({required this.myMatchModel});
  @override
  State<CurrentMatchCardWidget> createState() => _CurrentMatchCardWidgetState();
}

class _CurrentMatchCardWidgetState extends State<CurrentMatchCardWidget> {
  var controller = Get.put(HomeController());
  Duration? remainingDuration;
  var targetDate;
  _calculateTimeRemaining() {
    DateTime now = DateTime.now();
    targetDate = DateFormat("yyyy-MM-dd hh:mm:ss")
        .parse(widget.myMatchModel.matchDateTime);
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 0),
      child: InkWell(
        onTap: () {
       
            Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LiveContestScreen(
//  matchId: '1',
flag: 'Upcoming Match',

              myMatchModel: widget.myMatchModel,
            );
          }));
          
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          //  height: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: ColorConstant.primaryWhiteColor),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: Get.width / 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/green_card_bg.png'),
                          fit: BoxFit.fill)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
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
                                          widget.myMatchModel.team1.teamImage),
                                      fit: BoxFit.fill)),
                            ),
                            //  SizedBox(width: 10,),
                            // Text(
                            //   widget.myMatchModel.team1.teamShortName,
                            //   style: TextStyle(
                            //       color: ColorConstant.primaryBlackColor,
                            //       fontSize: 13,
                            //       fontWeight: FontWeight.w600),
                            // ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 30,
                              //width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorConstant.bandColor),
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: CountdownTimer(
                                  endWidget: remainingDuration!.inHours < 0
                                      ? const Text(
                                          "Completed",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : const Text(
                                          "Live",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                  endTime: targetDate.millisecondsSinceEpoch,
                                  textStyle: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.myMatchModel.matchDateTime,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            // Text(
                            //   widget.myMatchModel.team2.teamName + " ",
                            //   style: TextStyle(
                            //       color: ColorConstant.primaryBlackColor,
                            //       fontSize: 13,
                            //       fontWeight: FontWeight.w600),
                            // ),
                            // SizedBox(width: 10,),
                            // Image.network(
                            //   widget.myMatchModel.team2.teamImage,
                            //   height: 40,
                            //   width: 40,
                            // ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          widget.myMatchModel.team2.teamImage),
                                      fit: BoxFit.fill)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: ColorConstant.deviderColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        widget.myMatchModel.team1.teamShortName + " ",
                        style: TextStyle(
                            color: ColorConstant.primaryBlackColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "v",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // Image.network(
                      //   widget.myMatchModel.team2.teamImage,
                      //   height: 40,
                      //   width: 40,
                      // ),
                      Text(
                        widget.myMatchModel.team2.teamShortName + " ",
                        style: TextStyle(
                            color: ColorConstant.primaryBlackColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 0, right: 10, bottom: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.amber[100]),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 6,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.amber[200]),
                          alignment: Alignment.center,
                          child: Text(
                            "MEGA",
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                           widget.myMatchModel.mega=='0'? " Comming Soon":'₹'+widget.myMatchModel.mega,
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          ),
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
