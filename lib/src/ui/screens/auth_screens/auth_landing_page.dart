import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/login_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/register_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthLandingPage extends StatefulWidget {
  const AuthLandingPage({super.key});

  @override
  State<AuthLandingPage> createState() => _AuthLandingPageState();
}

class _AuthLandingPageState extends State<AuthLandingPage> {
  int _currentIndex = 0;
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height / 1,
        width: MediaQuery.of(context).size.width / 1,
        color: ColorConstant.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
                child: 
                
                Image.asset(
                 ImageUitls.home_page_app_Logo,
                  height: 50,
                  fit: BoxFit.cover,
                )),

            CarouselSlider(
                items: [
                  for (int i = 0;
                      i < controller.splashDataApiResponse.loginBanner.length;
                      i++)
                    Container(
                      //  height: MediaQuery.of(context).size.height / 2,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width / 1.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: CachedNetworkImage(
                                imageUrl: controller
                                    .splashDataApiResponse.loginBanner[i].img,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                       Container(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            controller
                                    .splashDataApiResponse.loginBanner[i].title,
                            style: TextStyle(
                                color: ColorConstant.primaryWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: Text(
                              controller
                                    .splashDataApiResponse.loginBanner[i].description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 2,
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
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                )),

            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0;
                    i < controller.splashDataApiResponse.loginBanner.length;
                    i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: _currentIndex == i
                        ? Container(
                            width: 20,
                            height: 5,
                            decoration: BoxDecoration(
                                color: ColorConstant.primaryWhiteColor,
                                borderRadius: BorderRadius.circular(3)),
                          )
                        : Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                                color: ColorConstant.primaryWhiteColor,
                                shape: BoxShape.circle),
                          ),
                  )
              ],
            ),

// SizedBox(height: 20,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Get.deleteAll();
                      Navigator.push(
                        context,
                        (MaterialPageRoute(
                          builder: (context) {
                            return RegisterScreen();
                          },
                        )),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorConstant.primaryWhiteColor),
                      alignment: Alignment.center,
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: ColorConstant.primaryBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
// SizedBox(h)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Already a user?  ",
                            style: TextStyle(
                                color: ColorConstant.primaryWhiteColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Get.deleteAll();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const LoginScreen();
                              }));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: ColorConstant.primaryWhiteColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          try {
                            await launch(
                                controller.splashDataApiResponse.data.termUrl);
                          } catch (e) {}
                        },
                        child: Text(
                          "Terms & Conditions",
                          style: TextStyle(
                              color: ColorConstant.primaryWhiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
