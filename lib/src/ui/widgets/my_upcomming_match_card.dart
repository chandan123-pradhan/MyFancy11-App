import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/models/get_my_mateches_api_response.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:intl/intl.dart';

class MyUpcommingMatchCardWidget extends StatefulWidget {
  final MyMatchModel matches;
  MyUpcommingMatchCardWidget({required this.matches});

  @override
  State<MyUpcommingMatchCardWidget> createState() =>
      _MyUpcommingMatchCardWidgetState();
}

class _MyUpcommingMatchCardWidgetState extends State<MyUpcommingMatchCardWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1,
      // height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstant.primaryWhiteColor,
          border: Border.all(width: 1, color: Colors.black26)),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
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
                          Icon(
                            Icons.movie_filter_outlined,
                            size: 18,
                            color: ColorConstant.deviderColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.matches.elevenOut=='0'?'':'Linup out',
                            style: TextStyle(
                                color: ColorConstant.greenColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            widget.matches.team1.teamImage,
                            height: 40,
                            width: 40,
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
                          Container(
                              height: 30,
                             // width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black12),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                child: CountdownTimer(
                                   endWidget: 
                                   remainingDuration!.inHours<0?Text("Completed"):
                                   
                                   Text("Live"),
                                  endTime: targetDate.millisecondsSinceEpoch,
                                  textStyle: TextStyle(fontSize: 14),
                                ),
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.matches.matchDateTime,
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
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
                            width: 5,
                          ),
                          Image.network(
                            widget.matches.team2.teamImage,
                            height: 40,
                            width: 40,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.matches.team1.teamName,
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.matches.team2.teamName,
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 1,
              color: ColorConstant.deviderColor,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange[50],
                          border: Border.all(width: 1, color: Colors.orange)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
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
                      height: 35,
                      width: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.black26)),
                      child: Image.asset(
                        ImageUitls.Notification_icon,
                        height: 20,
                        width: 20,
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
    );
  }
}
