import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/Leader_baord_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/pick_player_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/winning_tab_screen.dart';
import 'package:cricket_fantacy/src/ui/widgets/mega_contest_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/multiple_contest_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/steper_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class JoinContest extends StatefulWidget {
  const JoinContest({super.key});

  @override
  State<JoinContest> createState() => _UpcommingMatchesDetailsState();
}

class _UpcommingMatchesDetailsState extends State<JoinContest> {
  int _currentIndex = 0;
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SS vs LKK",
              style: TextStyle(
                  color: ColorConstant.primaryWhiteColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "06h 55m Left",
              style: TextStyle(
                  color: ColorConstant.primaryWhiteColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              ImageUitls.Wallet_icon,
              height: 20,
              width: 20,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Price Pool",
              style: TextStyle(
                  color: ColorConstant.primaryBlackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "₹ 9 Crores",
              style: TextStyle(
                  color: ColorConstant.primaryBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              width: MediaQuery.of(context).size.width / 1,
              child: LinearProgressIndicator(
                minHeight: 4,
                value: 0.3, // Set the value here
                backgroundColor: Colors.red[50],
                valueColor:
                    AlwaysStoppedAnimation<Color>(ColorConstant.primaryColor),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "22,78,230 spots left",
                  style: TextStyle(
                      color: ColorConstant.primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "78,230 spots",
                  style: TextStyle(
                      color: ColorConstant.disableColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const PickPlayerScreen();
                }));
              },
              child: Container(
                height: 35,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ColorConstant.greenColor),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "JOIN  ",
                      style: TextStyle(
                          color: ColorConstant.primaryWhiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "₹49",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "  ₹4",
                      style: TextStyle(
                          color: ColorConstant.primaryWhiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            child: Column(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Row(
                            children: [
                              Text(
                                "₹ 1 Crores",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.wine_bar_rounded,
                                size: 20,
                                color: Colors.black45,
                              ),
                              Text(
                                "60 %",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              //Icon(Icons.wine_bar_rounded,size: 20,color: Colors.black45,),
                              Text(
                                "Upto 20",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ]),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 18,
                              color: Colors.black45,
                            ),
                            Text(
                              " Guaranted",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: BoxDecoration(color: Colors.red[100]),
                  alignment: Alignment.centerLeft,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Earn 1 for every ₹10 Spent on a contest entry",
                      style: TextStyle(
                          color: ColorConstant.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),

// SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Container(
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
                      border: Border.all(
                          width: 1, color: ColorConstant.primaryColor),
                      borderRadius: BorderRadius.circular(35),
                      color: _currentIndex == 0
                          ? ColorConstant.primaryColor
                          : ColorConstant.un_selected_color,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Winnings",
                      style: TextStyle(
                          color: _currentIndex == 0
                              ? ColorConstant.primaryWhiteColor
                              : ColorConstant.primaryColor,
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
                      border: Border.all(
                          width: 1, color: ColorConstant.primaryColor),
                      borderRadius: BorderRadius.circular(35),
                      color: _currentIndex == 1
                          ? ColorConstant.primaryColor
                          : ColorConstant.un_selected_color,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Leaderboard",
                      style: TextStyle(
                          color: _currentIndex == 1
                              ? ColorConstant.primaryWhiteColor
                              : ColorConstant.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            )),
          ),

          CarouselSlider(
              items: [
                _currentIndex == 0
                    ? WinningTab()
                    : LeaderboardTab(),
               LeaderboardTab()
              ],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 2.1,
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

  void changeIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }
}
