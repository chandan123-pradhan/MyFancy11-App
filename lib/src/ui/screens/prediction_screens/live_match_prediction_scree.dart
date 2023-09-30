import 'package:cricket_fantacy/src/controllers/quiz_controller.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/models/get_my_mateches_api_response.dart';
import 'package:cricket_fantacy/src/ui/screens/prediction_screens/quiz_details_bottom_sheet.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LiveMatchPredictionHomePage extends StatefulWidget {
  final MyMatchModel matches;
  LiveMatchPredictionHomePage({required this.matches});

  @override
  State<LiveMatchPredictionHomePage> createState() => _LiveMatchPredictionHomePagePageState();
}

class _LiveMatchPredictionHomePagePageState extends State<LiveMatchPredictionHomePage> {
 
  
  int selectedCategory = 0;

  var controller = Get.put(QuizController());
  @override
  void initState() {
    _calculateTimeRemaining();
    controller.getQuizListByMatchId(widget.matches.matchId.toString());
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
    return  Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBar(
              elevation: 0,
              backgroundColor: ColorConstant.primaryBlackColor,
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
              centerTitle: false,
              title: Text(
                "Prediction",
                style: TextStyle(
                    color: ColorConstant.primaryWhiteColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
    
              // actions: [
              //   Padding(
              //     padding: const EdgeInsets.only(right: 20.0),
              //     child: Image.asset(
              //       ImageUitls.Wallet_icon,
              //       height: 20,
              //       width: 20,
              //     ),
              //   )
              // ],
            ),
          ),
          body: Column(
            children: [
              Container(
                color: ColorConstant.primaryBlackColor,
                //height: 60,
                width: MediaQuery.of(context).size.width / 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                widget.matches.team1.teamImage),
                                            fit: BoxFit.fill)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    widget.matches.team1.teamShortName,
                                    style: TextStyle(
                                        color: ColorConstant.primaryWhiteColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text(
                              //       "187/3*",
                              //       style: TextStyle(
                              //           color: ColorConstant.primaryWhiteColor,
                              //           fontSize: 20,
                              //           fontWeight: FontWeight.w500),
                              //     ),
                              //     SizedBox(height: 8),
                              //     Text(
                              //       "16.4 OVRß",
                              //       style: TextStyle(
                              //           color: ColorConstant.primaryWhiteColor,
                              //           fontSize: 10,
                              //           fontWeight: FontWeight.w400),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                widget.matches.team2.teamImage),
                                            fit: BoxFit.fill)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    widget.matches.team2.teamShortName,
                                    style: TextStyle(
                                        color: ColorConstant.primaryWhiteColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "SCORECARD",
                            style: TextStyle(
                                color: Colors.yellow[200],
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5),
                        CountdownTimer(
                endWidget: Text("Live"),
                endTime: targetDate.millisecondsSinceEpoch,
                textStyle: TextStyle(fontSize: 10,color: ColorConstant.primaryWhiteColor),
                
              ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GetBuilder<QuizController>(
                  init: QuizController(),
                  builder: (controller) {
                    return isFetchingData == true
                        ? shimerEffect(length: 5, context: context)
                        : Expanded(
                            child: Column(
                              children: [
                              
                                Expanded(
                                  child: GetBuilder<QuizController>(
                                      init: QuizController(),
                                      builder: (controller) {
                                        return controller
                                                    .getQuizByMatchId ==
                                                null
                                            ? shimerEffect(
                                                length: 5, context: context)
                                            : controller.getQuizByMatchId!
                                                        .data.length ==
                                                    0
                                                ? Center(
                                                    child:
                                                        Text("There is No Any Quiz"),
                                                  )
                                                : ListView.builder(
                                                    itemCount: controller
                                                        .getQuizByMatchId!
                                                        .data
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                bottom: 5.0,
                                                                top: 10),
                                                        child: Container(
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                // height: 100,
                                                                decoration: BoxDecoration(
                                                                    border: Border(
                                                                        bottom: BorderSide(
                                                                            width:
                                                                                1,
                                                                            color:
                                                                                Colors.black38))),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          15,
                                                                          3,
                                                                          15,
                                                                          3),
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Icon(
                                                                            Icons
                                                                                .person,
                                                                            size:
                                                                                20,
                                                                            color:
                                                                                ColorConstant.primaryBlackColor,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                            "${controller.getQuizByMatchId!.data[index].totalTrade} Traders",
                                                                            style: TextStyle(
                                                                                color: ColorConstant.primaryBlackColor,
                                                                                fontSize: 13,
                                                                                fontWeight: FontWeight.w500),
                                                                          ),
                                                                          Icon(
                                                                            Icons
                                                                                .navigate_next_outlined,
                                                                            size:
                                                                                20,
                                                                            color:
                                                                                ColorConstant.primaryBlackColor,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width / 1.3,
                                                                            child:
                                                                                Text(
                                                                              controller.getQuizByMatchId!.data[index].question,
                                                                              style: TextStyle(
                                                                                  color: ColorConstant.primaryBlackColor,
                                                                                  fontSize: 15,
                                                                                  fontWeight: FontWeight.w500),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(5),
                                                                                color: Colors.blue[50]),
                                                                            child:
                                                                                Padding(
                                                                              padding:
                                                                                  const EdgeInsets.only(top: 5, bottom: 5),
                                                                              child:
                                                                                  Image.network(
                                                                                controller.getQuizByMatchId!.data[index].icon,
                                                                                height: 50,
                                                                                width: 50,
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.of(context)
                                                                                .size
                                                                                .width /
                                                                            1,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(left: 20),
                                                                          child:
                                                                              Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.circle,
                                                                                size: 10,
                                                                                color: ColorConstant.primaryColor,
                                                                              ),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  controller.getQuizByMatchId!.data[index].note,
                                                                                  style: TextStyle(color: ColorConstant.primaryBlackColor, fontSize: 12, fontWeight: FontWeight.w500),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              controller.getQuizDetails(controller.getQuizByMatchId!.data[index].quizId.toString(),
                                                                                 'yes');
                                                                              showModalBottomSheet(
    
                                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                                                                  isScrollControlled: true,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return QuizDetailsBottomSheet(
                                                                                      quizData: controller.getQuizByMatchId!.data[index],
                                                                                       flag:    'yes'
                                                                                    );
                                                                                  }).then((value) {
                                                                                    controller.quizDetailsTimer!.cancel();
                                                                                  });
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width:
                                                                                  MediaQuery.of(context).size.width / 2.5,
                                                                              height:
                                                                                  40,
                                                                              decoration:
                                                                                  BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.blue[50]),
                                                                              alignment:
                                                                                  Alignment.center,
                                                                              child:
                                                                                  Text(
                                                                                "Yes ₹${controller.getQuizByMatchId!.data[index].option1}",
                                                                                style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.w600),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              controller.getQuizDetails(
                                                                                  controller.getQuizByMatchId!.data[index].quizId.toString(),
                                                                                  
                                                                                  'no');
                                                                              showModalBottomSheet(
                                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                                                                  isScrollControlled: true,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return QuizDetailsBottomSheet(
                                                                                      quizData: controller.getQuizByMatchId!.data[index],
                                                                                  flag:    'no'
                                                                                    );
                                                                                  });
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width:
                                                                                  MediaQuery.of(context).size.width / 2.5,
                                                                              height:
                                                                                  40,
                                                                              decoration:
                                                                                  BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.red[50]),
                                                                              alignment:
                                                                                  Alignment.center,
                                                                              child:
                                                                                  Text(
                                                                                "No ₹${controller.getQuizByMatchId!.data[index].option2}",
                                                                                style: TextStyle(color: ColorConstant.primaryColor, fontSize: 15, fontWeight: FontWeight.w600),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                      }),
                                )
                              ],
                            ),
                          );
                  })
            ],
          ));
    

    //);
  }
}




