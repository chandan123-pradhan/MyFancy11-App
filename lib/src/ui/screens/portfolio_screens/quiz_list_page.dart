import 'package:cricket_fantacy/src/controllers/quiz_controller.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/ui/screens/prediction_screens/quiz_details_bottom_sheet.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizListPage extends StatefulWidget {
  
  @override
  State<QuizListPage> createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
 
  
  int selectedCategory = 0;

  var controller = Get.put(QuizController());
  @override
  void initState() {
    controller.getQuizCategory();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
       
        body: Column(
          children: [
 GetBuilder<QuizController>(
                init: QuizController(),
                builder: (controller) {
                  return controller.getQuizCategoryApiResponse == null
                      ? shimerEffect(length: 5, context: context)
                      : Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 55,
                                width: MediaQuery.of(context).size.width / 1,
                                color: Colors.black12,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller
                                        .getQuizCategoryApiResponse!
                                        .data
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 10,
                                            bottom: 10),
                                        child: InkWell(
                                          onTap: () {
                                            selectedCategory = index;
                                            setState(() {});
                                            controller.getQuizList(controller
                                                .getQuizCategoryApiResponse!
                                                .data[index]
                                                .categoryId
                                                .toString());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  offset: Offset(0,
                                                      1), // changes position of shadow
                                                ),
                                              ],
                                              color: selectedCategory == index
                                                  ? ColorConstant
                                                      .primaryBlackColor
                                                  : ColorConstant
                                                      .primaryWhiteColor,
                                            ),
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 5, 10, 5),
                                              child: Text(
                                                controller
                                                    .getQuizCategoryApiResponse!
                                                    .data[index]
                                                    .title,
                                                style: TextStyle(
                                                    color: selectedCategory ==
                                                            index
                                                        ? ColorConstant
                                                            .primaryWhiteColor
                                                        : Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              Expanded(
                                child: GetBuilder<QuizController>(
                                    init: QuizController(),
                                    builder: (controller) {
                                      return controller
                                                  .getQuizByCategoryApiResponse ==
                                              null
                                          ? shimerEffect(
                                              length: 5, context: context)
                                          : controller.getQuizByCategoryApiResponse!
                                                      .data.length ==
                                                  0
                                              ? Center(
                                                  child:
                                                      Text("No Data Available"),
                                                )
                                              : ListView.builder(
                                                  itemCount: controller
                                                      .getQuizByCategoryApiResponse!
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
                                                                          "${controller.getQuizByCategoryApiResponse!.data[index].totalTrade} Traders",
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
                                                                            controller.getQuizByCategoryApiResponse!.data[index].question,
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
                                                                              controller.getQuizByCategoryApiResponse!.data[index].icon,
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
                                                                                controller.getQuizByCategoryApiResponse!.data[index].note,
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
                                                                            controller.getQuizDetails(controller.getQuizByCategoryApiResponse!.data[index].quizId.toString(),
                                                                               'yes');
                                                                            showModalBottomSheet(
                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                                                                isScrollControlled: true,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return QuizDetailsBottomSheet(
                                                                                    quizData: controller.getQuizByCategoryApiResponse!.data[index],
                                                                                     flag:    'yes'
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
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.blue[50]),
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child:
                                                                                Text(
                                                                              "Yes ₹${controller.getQuizByCategoryApiResponse!.data[index].option1}",
                                                                              style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.w600),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            controller.getQuizDetails(
                                                                                controller.getQuizByCategoryApiResponse!.data[index].quizId.toString(),
                                                                                
                                                                                'no');
                                                                            showModalBottomSheet(
                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                                                                isScrollControlled: true,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return QuizDetailsBottomSheet(
                                                                                    quizData: controller.getQuizByCategoryApiResponse!.data[index],
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
                                                                              "No ₹${controller.getQuizByCategoryApiResponse!.data[index].option2}",
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
