import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/login_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/upcomming_matches_details.dart';
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
              : controller.getLatestMyMatchResponse == null
                  ? Padding(
                    padding: const EdgeInsets.only(top:15),
                    child: shimerEffect(
                      length: 3,context: context
                    ),
                  )

                  : Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                       
              controller.getLatestMyMatchResponse!.data.isEmpty?Container():         
                          Container(
                      width: MediaQuery.of(context).size.width / 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "My Matches",
                              style: TextStyle(
                                  color: ColorConstant.primaryBlackColor,
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
                          for (int i = 0;
                              i <
                                  controller
                                      .getLatestMyMatchResponse!.data.length;
                              i++)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: CurrentMatchCardWidget(
                                myMatchModel: controller
                                    .getLatestMyMatchResponse!.data[i],
                              ),
                            )
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
                  Container(
                    margin: EdgeInsets.fromLTRB(6.0, 0, 6, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            controller.splashDataApiResponse.homeBanner[i].img),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 100.0,
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
              for (int i = 0; i < 5; i++)
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
          Padding(
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
                return controller.getMatchesApiResponse == null
                    ? shimerEffect(
                    length: 3,context: context
                  )
                    : Column(
                        children: [
                          for (int index = 0;
                              index <=
                                  controller
                                          .getMatchesApiResponse!.data.length -
                                      1;
                              index++)
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                              child: InkWell(
                                  onTap: () {
                                    if (logInStatus == true) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return UpcommingMatchesDetails(
                                          matches: controller
                                              .getMatchesApiResponse!
                                              .data[index],
                                        );
                                      }));
                                    } else {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
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
              })
      
      ,SizedBox(height: 60,)
        ],
      ),
    );
  }
}
