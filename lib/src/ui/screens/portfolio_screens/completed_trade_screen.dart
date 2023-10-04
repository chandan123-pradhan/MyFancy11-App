import 'package:cricket_fantacy/src/controllers/quiz_controller.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedTradePage extends StatefulWidget {
  const CompletedTradePage({super.key});

  @override
  State<CompletedTradePage> createState() => _CompletedTradePageState();
}

class _CompletedTradePageState extends State<CompletedTradePage> {
  var controller = Get.put(QuizController());
  @override
  void initState() {
    
    controller.getMyCompletedPortfolioList('2');
    // TODO: implement initState
    super.initState();
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
        centerTitle: false,
        title: Text(
          "Completed Trade",
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
      body: GetBuilder<QuizController>(
          init: QuizController(),
          builder: (controller) {
            return controller.getQuizMyListApiResponse == null
                ? shimerEffect(length: 5, context: context)
                :   GetBuilder<QuizController>(
                              init: QuizController(),
                              builder: (controller) {
                                return controller.getQuizMyListApiResponse ==
                                        null
                                    ? shimerEffect(length: 5, context: context)
                                    :  controller
                                                .completedQuiz.
                                                length ==
                                            0
                                        ? Center(
                                            child: Text("No Data Available"),
                                          )
                                        : 
                                        
                                        
                                        
                                        ListView.builder(
                                            itemCount: controller
                                                .completedQuiz
                                                
                                                .length,
                                            itemBuilder: (context, index) {
                                              return
                                             
                                               Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: index ==
                                                             controller
                                                .completedQuiz
                                                                    .length -
                                                                1
                                                        ? 30
                                                        : 5.0,
                                                    top: 10),
                                                child: InkWell(
                                                  onTap: () {
                                                    print(double.parse(controller
                                                        .getQuizMyListApiResponse!
                                                        .data[index]
                                                        .pl));
                                                  },
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: Container(
                                                            // height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorConstant
                                                                  .primaryWhiteColor,
                                                            ),
                                                            child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        15,
                                                                        15,
                                                                        15,
                                                                        15),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      1,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Q: " +
                                                                             controller
                                                .completedQuiz[index].question,
                                                                        style: TextStyle(
                                                                            color: ColorConstant
                                                                                .primaryBlackColor,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w500),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                         controller
                                                .completedQuiz[index].myOption ==
                                                                                1
                                                                            ? 'My Answer: Yes'
                                                                            : 'My Answer: No',
                                                                        style: TextStyle(
                                                                            color: ColorConstant
                                                                                .greenColor,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w500),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                "Investment: ",
                                                                                style: TextStyle(color: ColorConstant.primaryBlackColor, fontSize: 15, fontWeight: FontWeight.w500),
                                                                              ),
                                                                              Text(
                                                                                "₹ ${double.parse( controller
                                                .completedQuiz[index].amount) * int.parse( controller
                                                .completedQuiz[index].qty)}",
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
                                                                                "₹" +  controller
                                                .completedQuiz[index].win.toString(),
                                                                                style: TextStyle(color: double.parse( controller
                                                .completedQuiz[index].win) <= double.parse( controller
                                                .completedQuiz[index].pl) ? ColorConstant.primaryColor : ColorConstant.primaryBlackColor, fontSize: 15, fontWeight: FontWeight.w500),
                                                                              ),
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "Win: ",
                                                                                style: TextStyle(color: ColorConstant.primaryBlackColor, fontSize: 15, fontWeight: FontWeight.w500),
                                                                              ),
                                                                              Text(
                                                                                 controller
                                                .completedQuiz[index].pl.toString() + "%",
                                                                                style: TextStyle(color: double.parse(controller.completedQuiz[index].pl) <= 0 ? ColorConstant.primaryColor : ColorConstant.primaryBlackColor, fontSize: 15, fontWeight: FontWeight.w500),
                                                                              ),
                                                                            ],
                                                                          ),
                                                //                           InkWell(
                                                //                             onTap:
                                                //                                 () {
                                                //                               controller.sellQuiz( controller
                                                // .completedQuiz[index], context);
                                                //                             },
                                                //                             child:
                                                //                                 Container(
                                                //                               height: 35,
                                                //                               width: 100,
                                                //                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: (double.parse(controller.getQuizMyListApiResponse!.data[index].pl) < 0) ? ColorConstant.primaryColor : ColorConstant.greenColor),
                                                //                               alignment: Alignment.center,
                                                //                               child: Text(
                                                //                                 "SELL",
                                                //                                 style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                                                //                               ),
                                                //                             ),
                                                //                           ),
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
                              });
                      
                      
                    
                  
          }),
    );
  }
}
