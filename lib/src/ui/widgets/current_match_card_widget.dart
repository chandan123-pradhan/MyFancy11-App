import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/models/get_my_mateches_api_response.dart';
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
  var controller=Get.put(HomeController());
   var targetDate;
  _calculateTimeRemaining() {
    DateTime now = DateTime.now();
    targetDate =
        DateFormat("yyyy-MM-dd hh:mm:ss").parse(widget.myMatchModel.matchDateTime);
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
    return 
    
    Container(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network(
                               widget.myMatchModel.team1.teamImage,
                                height: 40,
                                width: 40,
                              ),
                              Text(
                               widget.myMatchModel.team1.teamShortName,
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
                                height: 25,
                                //width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(left:10,right:10),
                                  child: CountdownTimer(
                                     endWidget: Text("Live"),
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
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                widget.myMatchModel.team2.teamName+" ",
                                style: TextStyle(
                                    color: ColorConstant.primaryBlackColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.network(
                               widget.myMatchModel.team2.teamImage,
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
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
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "1 Team 1 Contest",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
        
        
  }
}