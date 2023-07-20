import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/auth_landing_page.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/fantacy_tab.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:cricket_fantacy/src/utils/local_storage/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  var controller = Get.put(HomeController());
  void changeIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    controller.getUsersProfile();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: ColorConstant.primaryColor,
            elevation: 0,
          )),
      body: Column(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height/5,
            width: MediaQuery.of(context).size.width / 1,
            decoration: const BoxDecoration(
              color: ColorConstant.primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height/10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          alignment: Alignment.centerLeft,
                          child: GetBuilder<HomeController>(
                              init: HomeController(),
                              builder: (controller) {
                                return InkWell(
                                  onTap: () {
                                    SharedPref sharedPref = new SharedPref();
                                    sharedPref.logout();
                                    Get.deleteAll();
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (context) {
                                      return AuthLandingPage();
                                    }), (route) => false);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                          controller.profilePicUrl,
                                        ))), // backgroundColor: ColorConstant.primaryColor,
                                  ),
                                );
                              }),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          alignment: Alignment.center,
                          child: const Text(
                            "My Fantacy11",
                            style: TextStyle(
                                color: ColorConstant.primaryWhiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                ImageUitls.Notification_icon,
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset(
                                ImageUitls.Wallet_icon,
                                height: 20,
                                width: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
// height: MediaQuery.of(context).size.height/9,
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          changeIndex(0);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: _currentIndex == 0
                                ? ColorConstant.primaryWhiteColor
                                : ColorConstant.un_selected_color,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Fantacy",
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeIndex(1);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: _currentIndex == 1
                                ? ColorConstant.primaryWhiteColor
                                : ColorConstant.un_selected_color,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Prediction",
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          CarouselSlider(
              items: [
                _currentIndex == 0
                    ? Container(
                        color: ColorConstant.bg_color,
                        child: FantacyTab(),
                      )
                    : Container(
                        color: ColorConstant.bg_color,
                        child: Center(child: Text("Prediction Tab")),
                      ),
                Container(
                  color: ColorConstant.bg_color,
                  child: Center(child: Text("Prediction Tab")),
                ),
              ],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 1.37,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  changeIndex(index);
                  //controller.updateHome2Slider(index);
                },
                scrollDirection: Axis.horizontal,
              )),
        ],
      ),
    );
  }
}
