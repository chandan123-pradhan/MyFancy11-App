import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamPreviewPage extends StatefulWidget {
  const TeamPreviewPage({super.key});

  @override
  State<TeamPreviewPage> createState() => _TeamPreviewPageState();
}

class _TeamPreviewPageState extends State<TeamPreviewPage> {
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Column(
            children: [
              Container(
                height: 40,
color: ColorConstant.primaryBlackColor,
              ),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width / 1,
                color: ColorConstant.primaryBlackColor,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Players",
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${controller.choosedPlayerList.length+1}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 25,
                            decoration: BoxDecoration(
                                color: ColorConstant.primaryWhiteColor,
                                borderRadius: BorderRadius.circular(5)),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                "PBKS",
                                style: TextStyle(
                                    color: ColorConstant.primaryBlackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "6",
                            style: TextStyle(
                                color: ColorConstant.primaryWhiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            " : ",
                            style: TextStyle(
                                color: ColorConstant.primaryWhiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "5",
                            style: TextStyle(
                                color: ColorConstant.primaryWhiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 25,
                            decoration: BoxDecoration(
                                color: ColorConstant.primaryBlackColor,
                                borderRadius: BorderRadius.circular(5)),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                "RR",
                                style: TextStyle(
                                    color: ColorConstant.primaryWhiteColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Credit left",
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            controller.totalCreditPoint.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  
                  // height: MediaQuery.of(context).size.height/1,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: const BoxDecoration(
                    color: ColorConstant.green,
                    image: DecorationImage(
                        image: AssetImage(ImageUitls.team_preview_image),
                        fit: BoxFit.fill),
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 10,
                        child: Text(
                          "WICKET KEEPERS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),

                      Positioned(
                        top: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            width:controller.choosedWiketKeeperList.length>4?
                             MediaQuery.of(context).size.width/1.01: MediaQuery.of(context).size.width/1.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0;
                                    i < controller.choosedWiketKeeperList.length;
                                    i++)
                                  playerWidget(
                                    name: controller.choosedWiketKeeperList[i].playerShortname,
                                    sellPrice: '',
                                    image: controller.choosedWiketKeeperList[i].image
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //      Positioned(top: 40, right: 45, child: playerWidget()),

                      Positioned(
                        top: MediaQuery.of(context).size.height / 4,
                        child: Text(
                          "BATTER",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height / 3.5,
                         // left: 20,
                          child:Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            width:controller.choosedBatsManList.length>4?
                             MediaQuery.of(context).size.width/1.01: MediaQuery.of(context).size.width/1.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0;
                                    i < controller.choosedBatsManList.length;
                                    i++)
                                  playerWidget(
                                    name: controller.choosedBatsManList[i].playerShortname,
                                    sellPrice: '',
                                    image: controller.choosedBatsManList[i].image
                                  ),
                              ],
                            ),
                          ),
                        ),),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 1.95,
                        child: Text(
                          "ALL-ROUNDER",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height / 1.8,
                         // left: 30,
                          child:Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            width:controller.choosedAllRounderList.length>4?
                             MediaQuery.of(context).size.width/1.01: MediaQuery.of(context).size.width/1.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0;
                                    i < controller.choosedAllRounderList.length;
                                    i++)
                                  playerWidget(
                                    name: controller.choosedAllRounderList[i].playerShortname,
                                    sellPrice: '',
                                    image: controller.choosedAllRounderList[i].image
                                  ),
                              ],
                            ),
                          ),
                        ),),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 1.38,
                        child: Text(
                          "BOWLERS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height / 1.3,
                         // left: 30,
                          child:Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            width:
                            controller.choosedBowlerlist.length>4?
                             MediaQuery.of(context).size.width/1.01: MediaQuery.of(context).size.width/1.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0;
                                    i < controller.choosedBowlerlist.length;
                                    i++)
                                  playerWidget(
                                    name: controller.choosedBowlerlist[i].playerShortname,
                                    sellPrice: '',
                                    image: controller.choosedBowlerlist[i].image
                                  ),
                              ],
                            ),
                          ),
                        ),)
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }

  Widget playerWidget({required String image, required String name, required String sellPrice}) {
    return Column(
      children: [
        Image.network(
          image,
          height: 50,
          width: 40,
        ),
        Container(
         // width: 70,
          alignment: Alignment.center,
          color: ColorConstant.primaryBlackColor,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              name,
              style: TextStyle(
                  color: ColorConstant.primaryWhiteColor, fontSize: 11),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          sellPrice,
          style:
              TextStyle(color: ColorConstant.primaryWhiteColor, fontSize: 11),
        ),
      ],
    );
  }
}
