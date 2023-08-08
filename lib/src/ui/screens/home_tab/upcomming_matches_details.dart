import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/join_contest_screen.dart';
import 'package:cricket_fantacy/src/ui/widgets/mega_contest_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/multiple_contest_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/steper_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class UpcommingMatchesDetails extends StatefulWidget {
  final Matches matches;
  UpcommingMatchesDetails({required this.matches});

  @override
  State<UpcommingMatchesDetails> createState() =>
      _UpcommingMatchesDetailsState();
}

class _UpcommingMatchesDetailsState extends State<UpcommingMatchesDetails> {
  var controller = Get.put(HomeController());
  
  @override
  void initState() {
    _calculateTimeRemaining();
    controller.getContestList(context, widget.matches.matchId.toString());

    // TODO: implement initState
    super.initState();
  }
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bg_color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.navigate_before,
            size: 30,
            color: ColorConstant.primaryWhiteColor,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.matches.team2.teamName} Vs ${widget.matches.team1.teamName}",
              style: TextStyle(
                  color: ColorConstant.primaryWhiteColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            CountdownTimer(
              endWidget: Text("Live"),
              endTime: targetDate.millisecondsSinceEpoch,
              textStyle: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              ImageUitls.Wallet_icon,
              height: 20,
              width: 20,
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepperWidget(
              step: 2,
            ),
            Container(
              height: 40,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Short By: ",
                      style: TextStyle(
                          color: ColorConstant.disableColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 1.4,
                      alignment: Alignment.centerLeft,
                      child: ListView(
                        padding: EdgeInsets.only(top: 10),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "Entry",
                              style: TextStyle(
                                  color: ColorConstant.disableColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "Spots",
                              style: TextStyle(
                                  color: ColorConstant.disableColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "Price Pool",
                              style: TextStyle(
                                  color: ColorConstant.disableColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "% Winners",
                              style: TextStyle(
                                  color: ColorConstant.disableColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.filter_alt,
                      size: 25,
                      color: Colors.black38,
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: ColorConstant.deviderColor))),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
                  child: GetBuilder<HomeController>(
                      init: HomeController(),
                      builder: (controller) {
                        return controller.getContestListApiResponse == null
                            ? Center(
                                child: CircularProgressIndicator(
                                    color: ColorConstant.primaryColor),
                              )
                            : ListView.builder(
                                itemCount: controller.getContestListApiResponse!
                                    .contestList.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      controller
                                                  .getContestListApiResponse!
                                                  .contestList[index]
                                                  .data
                                                  .length ==
                                              0
                                          ? Container()
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 14, top: 10),
                                              child: Text(
                                                controller
                                                    .getContestListApiResponse!
                                                    .contestList[index]
                                                    .name,
                                                style: TextStyle(
                                                    color: ColorConstant
                                                        .primaryBlackColor,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                      for (int i = 0;
                                          i <
                                              controller
                                                  .getContestListApiResponse!
                                                  .contestList[index]
                                                  .data
                                                  .length;
                                          i++)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 14, top: 10),
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return JoinContest(
                                                    matches: widget.matches,
                                                    contest: controller
                                                        .getContestListApiResponse!
                                                        .contestList[index]
                                                        .data[i],
                                                  );
                                                }));
                                              },
                                              child: MegaContestWidget(
                                                contest: controller
                                                    .getContestListApiResponse!
                                                    .contestList[index]
                                                    .data[i],
                                              )),
                                        ),
                                    ],
                                  );
                                });
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
