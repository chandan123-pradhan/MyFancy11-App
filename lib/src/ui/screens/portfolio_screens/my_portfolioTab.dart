import 'package:cricket_fantacy/src/controllers/quiz_controller.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/ui/screens/portfolio_screens/completed_trade_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/prediction_screens/quiz_details_bottom_sheet.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioTab extends StatefulWidget {
  @override
  State<PortfolioTab> createState() => _PortfolioTabState();
}

class _PortfolioTabState extends State<PortfolioTab> {
  int selectedCategory = 0;

  var controller = Get.put(QuizController());
  @override
  void initState() {
    controller.getMyPortfolioList('1');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: RefreshIndicator(
        onRefresh: () async {
         controller.getMyPortfolioList('1');
        },
          child: Column(
            children: [
              GetBuilder<QuizController>(
                  init: QuizController(),
                  builder: (controller) {
                    return controller.getQuizMyListApiResponse == null
                        ? shimerEffect(length: 5, context: context)
                        : Expanded(
                            child: Column(
                              children: [
                                Container(
        //  height: 120,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total Trade Amount: ",
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .primaryBlackColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "₹${controller.getQuizMyListApiResponse!.trad.amount}",
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .primaryBlackColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Winning Amount: ",
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .primaryBlackColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "₹${controller.getQuizMyListApiResponse!.trad.win}",
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .primaryBlackColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Win Percentage: ",
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .primaryBlackColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "${controller.getQuizMyListApiResponse!.trad.pl}%",
                                              style: TextStyle(
                                                  color: double.parse(controller
                                                              .getQuizMyListApiResponse!
                                                              .trad
                                                              .pl) >
                                                          0
                                                      ? ColorConstant.greenColor
                                                      : ColorConstant
                                                          .primaryColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(),
                                SizedBox(
                                  height: 0,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.myQuizTimer!.cancel();
                                    Navigator.push(
                                        context,
                                        (MaterialPageRoute(builder: (context) {
                                          return CompletedTradePage();
                                        }))).then((value){
controller.updateMyPortfolio('1');
                                        });
                                  },
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: ColorConstant.primaryBlackColor),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Completed",
                                      style: TextStyle(
                                          color: ColorConstant.primaryWhiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  child: GetBuilder<QuizController>(
                                      init: QuizController(),
                                      builder: (controller) {
                                        return controller
                                                    .getQuizMyListApiResponse ==
                                                null
                                            ? shimerEffect(
                                                length: 5, context: context)
                                            : controller.liveQuiz.length == 0
                                                ? Center(
                                                    child:
                                                        Text("No Data Available"),
                                                  )
                                                : ListView.builder(
                                                  physics: AlwaysScrollableScrollPhysics(),
                                                    itemCount: controller
                                                        .liveQuiz.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Padding(
                                                        padding: EdgeInsets.only(
                                                            bottom: index ==
                                                                    controller
                                                                            .liveQuiz
                                                                            .length -
                                                                        1
                                                                ? 100
                                                                : 5.0,
                                                            top: 10),
                                                        child: InkWell(
                                                          onTap: () {
                                                            print(double.parse(
                                                                controller
                                                                    .liveQuiz[
                                                                        index]
                                                                    .pl));
                                                          },
                                                          child: Container(
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          5.0),
                                                                  child:
                                                                      Container(
                                                                    // height: 100,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: ColorConstant
                                                                          .primaryWhiteColor,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                            padding: const EdgeInsets.fromLTRB(
                                                                                15,
                                                                                15,
                                                                                15,
                                                                                15),
                                                                            child:
                                                                                Container(
                                                                              width:
                                                                                  MediaQuery.of(context).size.width / 1,
                                                                              child:
                                                                                  Column(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    "Q: " + controller.liveQuiz[index].question,
                                                                                    style: TextStyle(color: ColorConstant.primaryBlackColor, fontSize: 15, fontWeight: FontWeight.w500),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Text(
                                                                                    controller.liveQuiz[index].myOption == '1' ? 'My Answer: Yes' : 'My Answer: No',
                                                                                    style: TextStyle(color: ColorConstant.greenColor, fontSize: 15, fontWeight: FontWeight.w500),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 5,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            "Investment: ",
                                                                                            style: TextStyle(color: ColorConstant.primaryBlackColor, fontSize: 15, fontWeight: FontWeight.w500),
                                                                                          ),
                                                                                          Text(
                                                                                            "₹ ${double.parse(controller.liveQuiz[index].amount) * int.parse(controller.liveQuiz[index].qty)}",
                                                                                            style: TextStyle(color: ColorConstant.primaryBlackColor, fontSize: 15, fontWeight: FontWeight.w500),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        children: [
                                                                                          Text(
                                                                                            "Return: ",
                                                                                            style: TextStyle(color: ColorConstant.primaryBlackColor, fontSize: 15, fontWeight: FontWeight.w500),
                                                                                          ),
                                                                                          Text(
                                                                                            "₹" + controller.liveQuiz[index].win.toString(),
                                                                                            style: TextStyle(color: double.parse(controller.getQuizMyListApiResponse!.data[index].win) <= double.parse(controller.getQuizMyListApiResponse!.data[index].pl) ? ColorConstant.primaryColor : ColorConstant.primaryBlackColor, fontSize: 15, fontWeight: FontWeight.w500),
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
                                                                                          Text(
                                                                                            "Win: ",
                                                                                            style: TextStyle(color: ColorConstant.primaryBlackColor, fontSize: 15, fontWeight: FontWeight.w500),
                                                                                          ),
                                                                                          Text(
                                                                                            controller.liveQuiz[index].pl.toString() + "%",
                                                                                            style: TextStyle(color: double.parse(controller.getQuizMyListApiResponse!.data[index].pl) <= 0 ? ColorConstant.primaryColor : ColorConstant.primaryBlackColor, fontSize: 15, fontWeight: FontWeight.w500),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      InkWell(
                                                                                        onTap: () {
                                                                                          controller.sellQuiz(controller.liveQuiz[index], context, index);
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 35,
                                                                                          width: 100,
                                                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: (double.parse(controller.getQuizMyListApiResponse!.data[index].pl) < 0) ? ColorConstant.primaryColor : ColorConstant.greenColor),
                                                                                          alignment: Alignment.center,
                                                                                          child: Text(
                                                                                            "SELL",
                                                                                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            )),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
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
          ),
        ));

    //);
  }
}
