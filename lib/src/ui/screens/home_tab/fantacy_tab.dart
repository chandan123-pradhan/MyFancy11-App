import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/login_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/upcomming_matches_details.dart';
import 'package:cricket_fantacy/src/ui/screens/live_contest_screens/live_contest_screen.dart';
import 'package:cricket_fantacy/src/ui/widgets/current_match_card_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/upcomming_matches_card_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shimmer/shimmer.dart';

class FantacyTab extends StatefulWidget {
  const FantacyTab({super.key});

  @override
  State<FantacyTab> createState() => _FantacyTabState();
}

class _FantacyTabState extends State<FantacyTab> {
  int _currentIndex = 0;
  var controller = Get.put(HomeController());
  void _changeIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          logInStatus == false
              ? Container()
              : controller.getUpcommingMyMatchResponse == null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: shimerEffect(length: 3, context: context),
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 0, right: 0),
                      child: Column(
                        children: [
                          controller.getUpcommingMyMatchResponse!.data.isEmpty
                              ? Container()
                              : Container(
                                  width: MediaQuery.of(context).size.width / 1,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "My Matches",
                                          style: TextStyle(
                                              color: ColorConstant
                                                  .primaryBlackColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.end,
                                        //   children: const [
                                        //     InkWell(
                                        //       onT
                                        //       child: Text(
                                        //         "View All",
                                        //         style: TextStyle(
                                        //             color: ColorConstant.disableColor,
                                        //             fontSize: 13,
                                        //             fontWeight: FontWeight.w500),
                                        //       ),
                                        //     ),
                                        //     Icon(
                                        //       Icons.navigate_next_rounded,
                                        //       color: ColorConstant.disableColor,
                                        //       size: 25,
                                        //     )
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                          Container(
                            alignment: Alignment.centerLeft,
                            // width: MediaQuery.of(context).size.width/1,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  //1st Image of Slider
                                  for (int i = 0;
                                      i <
                                          controller
                                              .getUpcommingMyMatchResponse!
                                              .data
                                              .length;
                                      i++)
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: i == 0 ? 0 : 5, right: 5),
                                        child: InkWell(
                                          onTap: () {
                                            print("sdfs");
                                          },
                                          child: CurrentMatchCardWidget(
                                            myMatchModel: controller
                                                .getUpcommingMyMatchResponse!
                                                .data[i],
                                          ),
                                        ))
                                ],

                                // //Slider Container properties
                                // options: CarouselOptions(
                                //   height: 160,

                                //   enlargeCenterPage: false,

                                //   // disableCenter: true,
                                //   autoPlay: false,
                                //   aspectRatio: 16 / 9,
                                //   autoPlayCurve: Curves.fastOutSlowIn,
                                //   enableInfiniteScroll: false,
                                //   autoPlayAnimationDuration:
                                //       Duration(milliseconds: 800),
                                //   viewportFraction:0.8,
                                //   onPageChanged: (index, reason) {
                                //     // _changeIndex(index);
                                //   },
                                //),
                              ),
                            ),
                          ),
                        ],
                      )),
          SizedBox(
            height: 10,
          ),
          Container(
            // width: MediaQuery.of(context).size.width/1,
            child: CarouselSlider(
              items: [
                //1st Image of Slider
                for (int i = 0;
                    i < controller.splashDataApiResponse.homeBanner.length;
                    i++)
                  CachedNetworkImage(
                    width: MediaQuery.of(context).size.width / 1,
                    imageBuilder: (context, imageProvider) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Image.network(
                            controller.splashDataApiResponse.homeBanner[i].img,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                    imageUrl:
                        controller.splashDataApiResponse.homeBanner[i].img,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Container(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 120.0,
                enlargeCenterPage: false,

                // disableCenter: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.93,
                onPageChanged: (index, reason) {
                  _changeIndex(index);
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0;
                  i < controller.splashDataApiResponse.homeBanner.length;
                  i++)
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == i
                            ? ColorConstant.primaryColor
                            : ColorConstant.deviderColor),
                  ),
                )
            ],
          ),
          controller.getMatchesApiResponse == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Upcomming Matches",
                      style: TextStyle(
                          color: ColorConstant.primaryBlackColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
          GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return isFetchingData == true
                    ? shimerEffect(length: 3, context: context)
                    : controller.getMatchesApiResponse == null
                        ? Center()
                        : Column(
                            children: [
                              for (int index = 0;
                                  index <=
                                      controller.getMatchesApiResponse!.data
                                              .length -
                                          1;
                                  index++)
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                                  child: InkWell(
                                      onTap: () {
                                        if (logInStatus == true) {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return UpcommingMatchesDetails(
                                              matches: controller
                                                  .getMatchesApiResponse!
                                                  .data[index],
                                            );
                                          }));
                                        } else {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return LoginScreen();
                                          }));
                                        }
                                      },
                                      child: UpcommingMatchCardWidget(
                                        matches: controller
                                            .getMatchesApiResponse!.data[index],
                                      )),
                                )
                            ],
                          );
              }),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
