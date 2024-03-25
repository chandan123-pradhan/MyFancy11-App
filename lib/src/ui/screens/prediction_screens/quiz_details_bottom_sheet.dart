import 'dart:developer';

import 'package:cricket_fantacy/src/controllers/quiz_controller.dart';
import 'package:cricket_fantacy/src/models/get_quiz_by_category_api_response.dart';
import 'package:cricket_fantacy/src/ui/screens/wallets/wallet_screen.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class QuizDetailsBottomSheet extends StatefulWidget {
  QuizData quizData;
  String flag;
  QuizDetailsBottomSheet({required this.quizData, required this.flag});

  @override
  State<QuizDetailsBottomSheet> createState() => _QuizDetailsBottomSheetState();
}

class _QuizDetailsBottomSheetState extends State<QuizDetailsBottomSheet> {
  var controller = Get.put(QuizController());

  @override
  void initState() {
    controller.startQuizDetailsCallingApi(widget.quizData.quizId, widget.flag);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        init: QuizController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () {
              controller.quizDetailsTimer!.cancel();
              print("quiz details api calling closed");
              return Future.value(true);
            },
            child: Container(
                // height: MediaQuery.of(context).size.height * 0.75,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0),
                  ),
                ),
                child: controller.quizDetailsApiResponse == null
                    ? shimerEffect(length: 4, context: context)
                    : SingleChildScrollView(
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //  height: 130,
                              decoration: BoxDecoration(
                                  color: ColorConstant.primaryBlackColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.8,
                                          child: Text(
                                            controller.quizDetailsApiResponse!
                                                .data.question,
                                            style: TextStyle(
                                                color: ColorConstant
                                                    .primaryWhiteColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: (){
                                              launchUrl(Uri.parse('https://fighters11.com/how_to_quiz.html'),
 mode: LaunchMode.inAppWebView,
 );
                                            },
                                            child: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color: Colors.white30),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'How To Play?',
                                                style: TextStyle(
                                                    color: ColorConstant
                                                        .primaryWhiteColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/icons/apps.png",
                                          height: 16,
                                          width: 16,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          // width: MediaQuery.of(context).size.width/1.8,
                                          child: Text(
                                            controller.quizDetailsApiResponse!
                                                .data.note,
                                            style: TextStyle(
                                                color: ColorConstant
                                                    .primaryWhiteColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 70,
                              color: Colors.black12,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Investment',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '₹' +
                                              controller
                                                  .defaultInvenstmentAmount
                                                  .toStringAsFixed(2),
                                          style: TextStyle(
                                              color: ColorConstant
                                                  .primaryBlackColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    height: 60,
                                    width: 1,
                                    color: Colors.black26,
                                  ),

                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Returns',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '₹' +
                                              controller.defaultReturnAmount
                                                  .toStringAsFixed(2),
                                          style: TextStyle(
                                              color: ColorConstant
                                                  .primaryBlackColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //  Container(
                                  //   width: MediaQuery.of(context).size.width/2,
                                  // )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black12),
                                width: MediaQuery.of(context).size.width / 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.24,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: widget.flag == 'yes'
                                                ? ColorConstant.greenColor
                                                : Colors.transparent),
                                        //alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Yes ₹${controller.quizDetailsApiResponse!.data.option1}",
                                                style: TextStyle(
                                                    color: widget.flag == 'yes'
                                                        ? ColorConstant
                                                            .primaryWhiteColor
                                                        : Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    color: ColorConstant
                                                        .primaryWhiteColor),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "${((double.parse(controller.quizDetailsApiResponse!.data.option1)) * 10).toInt()}%",
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .primaryBlackColor,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // controller.startQuizDetailsCallingApi(widget.quizData.quizId,'no');
                                      },
                                      child: Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.3,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: widget.flag == 'no'
                                                ? ColorConstant.greenColor
                                                : Colors.transparent),
                                        //alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                " No ₹${controller.quizDetailsApiResponse!.data.option2}",
                                                style: TextStyle(
                                                    color: widget.flag == 'no'
                                                        ? Colors.white
                                                        : Colors.black87,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    color: ColorConstant
                                                        .primaryWhiteColor),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "${((double.parse(controller.quizDetailsApiResponse!.data.option2)) * 10).toInt()}%",
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .primaryBlackColor,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              //   height: 100,
                              width: MediaQuery.of(context).size.width / 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Select Price",
                                            style: TextStyle(
                                                color: ColorConstant
                                                    .primaryBlackColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "515 Contests",
                                            style: TextStyle(
                                                color: ColorConstant.greenColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          widget.flag == 'yes'
                                              ? Text(
                                                  "available at ₹${controller.quizDetailsApiResponse!.data.option1}",
                                                  style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              : Text(
                                                  "available at ₹${controller.quizDetailsApiResponse!.data.option2}",
                                                  style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          widget.flag == 'yes'
                                              ? Text(
                                                  "₹${controller.quizDetailsApiResponse!.data.option1} joining price",
                                                  style: TextStyle(
                                                      color: Colors.orange[500],
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              : Text(
                                                  "₹${controller.quizDetailsApiResponse!.data.option2} joining price",
                                                  style: TextStyle(
                                                      color: Colors.orange[500],
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          // Container(
                                          //   height: 19,
                                          //   width: 19,
                                          //   decoration: BoxDecoration(
                                          //       color: ColorConstant
                                          //           .primaryBlackColor),
                                          //   child: InkWell(
                                          //     onTap: () {
                                          //       controller.increaseOrDecrease(0);
                                          //     },
                                          //     child: Icon(
                                          //       Icons.remove,
                                          //       color: ColorConstant
                                          //           .primaryWhiteColor,
                                          //       size: 15,
                                          //     ),
                                          //   ),
                                          // ),

                                          widget.flag == 'yes'
                                              ? Text(
                                                  "₹${controller.quizDetailsApiResponse!.data.option1}",
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .primaryBlackColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              : Text(
                                                  "₹${controller.quizDetailsApiResponse!.data.option2}",
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .primaryBlackColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                          // InkWell(
                                          //   onTap: () {
                                          //     controller.increaseOrDecrease(1);
                                          //   },
                                          //   child: Icon(
                                          //     Icons.add_box_sharp,
                                          //     color:
                                          //         ColorConstant.primaryBlackColor,
                                          //     size: 25,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            //  SizedBox(
                            //                             height: 10,
                            //                           ),
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Number of Contract",
                                                style: TextStyle(
                                                    color: ColorConstant
                                                        .primaryBlackColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Select the number of contract you want to join with.",
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.black12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                controller.currentStockQty
                                                    .toString(),
                                                style: TextStyle(
                                                    color: ColorConstant
                                                        .primaryBlackColor,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                             
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Container(
                                    //   height: 40,
                                    //   width: MediaQuery.of(context).size.width/1,
                                    //   child: Slider(
                                    //     //divisions: 10,
                                    //     activeColor: ColorConstant.greenColor,
                                    //     inactiveColor: Colors.black12,

                                    //     min: 0.0,
                                    //     max: 100.0,
                                    //     value: _value,
                                    //     onChanged: (value) {
                                    //       setState(() {
                                    //         _value = value;
                                    //       });
                                    //     },
                                    //   ),
                                    // ),

                                    SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        activeTrackColor:
                                            ColorConstant.greenColor,
                                        inactiveTrackColor: Colors.black26,
                                        trackShape:
                                            RectangularSliderTrackShape(),
                                        trackHeight: 7.0,
                                        thumbColor: ColorConstant.greenColor,
                                        thumbShape: RoundSliderThumbShape(
                                            enabledThumbRadius: 12.0),
                                        overlayColor: Colors.red.withAlpha(32),
                                        overlayShape: RoundSliderOverlayShape(
                                            overlayRadius: 15.0),
                                      ),
                                      child: Container(
                                        // width: 400,
                                        child: Slider(
                                          min: 0,
                                          max: controller.overAllStockQty,
                                          // divisions: 5,
                                          value: controller.currentStockQty
                                              .toDouble(),
                                          onChanged: (value) {
                                            controller.changeQty(
                                                value.toInt(), widget.flag);
                                          },
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        //  debugger();
                                        if (controller.getWalletApiResponse!
                                                .data.depositWallet ==
                                            '0') {
                                          Messages().showErrorMsg(
                                              context: context,
                                              message:
                                                  "You Don't have money, add some money first.");
                                        } else {
                                          controller.buyQuiz(
                                              widget.quizData.quizId.toString(),
                                              widget.flag,
                                              context);
                                        }
                                      },
                                      child: Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1,
                                        decoration: BoxDecoration(
                                            color:
                                                ColorConstant.primaryBlackColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Join With Entry Fee ₹${controller.defaultInvenstmentAmount}",
                                          style: TextStyle(
                                              color: ColorConstant
                                                  .primaryWhiteColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "10% Platform fee will be charged on return",
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 6,
                            ),

                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1,
                              color: Colors.black12,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: controller.getWalletApiResponse == null
                                    ? Container()
                                    : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Balance:  ₹${controller.getWalletApiResponse!.data.depositWallet}",
                                                    style: TextStyle(
                                                        color: ColorConstant
                                                            .primaryBlackColor,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Icon(
                                                    Icons.navigate_next_rounded,
                                                    color: ColorConstant
                                                        .primaryBlackColor,
                                                    size: 20,
                                                  )
                                                ],
                                              ),
                                              controller.getWalletApiResponse!
                                                          .data.depositWallet ==
                                                      0
                                                  ? Text(
                                                      "Oops! Low Balance",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return WalletScreen(
                                                      isGoingBack: false,
                                                    );
                                                  }));
                                                },
                                                child: Text(
                                                  "Add Money",
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .primaryBlackColor,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              Icon(
                                                Icons.navigate_next_rounded,
                                                color: ColorConstant
                                                    .primaryBlackColor,
                                                size: 20,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )),
          );
        });
  }
}
