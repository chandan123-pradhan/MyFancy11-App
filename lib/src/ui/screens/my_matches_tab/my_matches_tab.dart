import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/auth_landing_page.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/fantacy_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/live_contest_screens/live_contest_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/notification_screens/Notification_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/wallets/wallet_screen.dart';
import 'package:cricket_fantacy/src/ui/widgets/my_live_match_card.dart';
import 'package:cricket_fantacy/src/ui/widgets/my_upcomming_match_card.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/upcomming_matches_card_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:cricket_fantacy/src/utils/local_storage/shared_prefrences.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MyMatchesTab extends StatefulWidget {
  const MyMatchesTab({super.key});

  @override
  State<MyMatchesTab> createState() => _MyMatchesTabState();
}

class _MyMatchesTabState extends State<MyMatchesTab>
    with SingleTickerProviderStateMixin {
  int _tabController = 0;
  late TabController _secondTabController;
  var controller = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    _secondTabController = TabController(length: 3, vsync: this);
    controller.getMyMatch(context, 'fixture');
    controller.getMyMatch(context, 'latest');
    controller.getMyMatch(context, 'live');
    controller.getMyMatch(context, 'result');
    // callGetMyMatchApi();
  }

  @override
  void dispose() {
    super.dispose();
    _secondTabController.dispose();
  }

  void _changeTopTab(index) {
    setState(() {
      _tabController = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: ColorConstant.primaryColor,
            elevation: 0,
          )),
      body: Column(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 1,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 1,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TabBar(
                controller: _secondTabController,
                indicatorColor: ColorConstant.primaryColor,
                indicatorWeight: 5,
                labelColor: ColorConstant.primaryBlackColor,
                tabs: const [
                  Tab(
                    text: 'Upcomming',
                  ),
                  Tab(text: "Live"),
                  Tab(text: 'Completed'),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _secondTabController,
              children: [
                upcomminMatchTabWidget(), // Content for Tab 1
                liveMatches(),
                completedMatches()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget upcomminMatchTabWidget() {
    return  RefreshIndicator(
        onRefresh: () async {
       controller.getMyMatch(context, 'fixture');
        },
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return logInStatus == false
                ? Center(
                    child: Text("You are not logged in."),
                  )
                : controller.getUpcommingMyMatchResponse == null
                    ? Center(
                        child: CircularProgressIndicator(
                          color: ColorConstant.primaryColor,
                        ),
                      )
                    : controller.getUpcommingMyMatchResponse!.data.isEmpty
                        ? Center(
                            child: Text("No Upcomming matches are available"),
                          )
                        : ListView.builder(
                           physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: controller
                                .getUpcommingMyMatchResponse!.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                                child: InkWell(
                                  onTap: () {
                                    print(controller
                                            .getUpcommingMyMatchResponse!
                                            .data[index].matchId);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return LiveContestScreen(
                                        myMatchModel: controller
                                            .getUpcommingMyMatchResponse!
                                            .data[index],
                                            flag: 'Upcoming Match',
                                      );
                                    }));
                                  },
                                  child: MyUpcommingMatchCardWidget(
                                      matches: controller
                                          .getUpcommingMyMatchResponse!
                                          .data[index],
                                          machesmodel: 
                                          controller.getMatchesApiResponse!.data[index]
                                          ,
                                          ),
                                ),
                              );
                            });
          }),
    );
  }

  Widget liveMatches() {
    return  RefreshIndicator(
        onRefresh: () async {
        controller.getMyMatch(context, 'latest');
    controller.getMyMatch(context, 'live');
        },
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return logInStatus == false
                ? Center(
                    child: Text("You are not logged in."),
                  )
                : controller.getLiveMyMatchReponse == null
                    ? shimerEffect(length: 3, context: context)
                    : controller.getLiveMyMatchReponse!.data.isEmpty
                        ? Center(
                            child: Text("No live matches are available"),
                          )
                        : ListView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount:
                                controller.getLiveMyMatchReponse!.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                    top: 8,
                                    bottom: index ==
                                            controller.getLiveMyMatchReponse!.data
                                                    .length -
                                                1
                                        ? 50
                                        : 8),
                                child: InkWell(
                                  onTap: () {
                                    print(controller
                                            .getLiveMyMatchReponse!
                                            .data[index].matchId);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return LiveContestScreen(
                                        myMatchModel: controller
                                            .getLiveMyMatchReponse!.data[index],
                                            flag: 'Live Match',
                                      );
                                    }));
                                  },
                                  child: MyLiveMatchCard(
                                    matches: controller
                                        .getLiveMyMatchReponse!.data[index],
                                  ),
                                ),
                              );
                            },
                          );
          }),
    );
  }

  Widget completedMatches() {
    return  RefreshIndicator(
        onRefresh: () async {
        controller.getMyMatch(context, 'result');
        },
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return logInStatus == false
                ? Center(
                    child: Text("You are not logged in."),
                  )
                : controller.getCompletedMyMatchResponse == null
                    ? shimerEffect(length: 2, context: context)
                    : controller.getCompletedMyMatchResponse!.data.isEmpty
                        ? Center(
                            child: Text("No completed matches are available"),
                          )
                        : ListView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: controller
                                .getCompletedMyMatchResponse!.data.length,
                            itemBuilder: (context, index) {
                              return 
                              
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                    top: 8,
                                    bottom: index ==
                                            controller.getCompletedMyMatchResponse!.data
                                                    .length -
                                                1
                                        ? 50
                                        : 8),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return LiveContestScreen(
                                          myMatchModel: controller
                                              .getCompletedMyMatchResponse!
                                              .data[index],
                                              flag: 'Completed Match',
                                        );
                                      }));
                                    },
                                    child: 
                                    
                                    
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 1,
                                      // height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: ColorConstant.primaryWhiteColor,
                                          border: Border.all(
                                              width: 1, color: Colors.black26)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .getCompletedMyMatchResponse!
                                                            .data[index]
                                                            .leagueName,
                                                        style: TextStyle(
                                                            color: ColorConstant
                                                                .primaryBlackColor,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                      ),
                                                      Row(
                                                        children: [
                                                          // Icon(
                                                          //   Icons
                                                          //       .movie_filter_outlined,
                                                          //   size: 18,
                                                          //   color: ColorConstant
                                                          //       .deviderColor,
                                                          // ),
                                                          // SizedBox(
                                                          //   width: 10,
                                                          // ),
                                                          // Text(
                                                          //   "Lineup Out",
                                                          //   style: TextStyle(
                                                          //       color: ColorConstant
                                                          //           .greenColor,
                                                          //       fontSize: 13,
                                                          //       fontWeight:
                                                          //           FontWeight
                                                          //               .w500),
                                                          // ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                        
                                                         Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          controller
                                                                .getCompletedMyMatchResponse!
                                                                .data[index]
                                                                .team1
                                                                .teamImage),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(width: 5,),
                                                        
                                                       
                                                          Text(
                                                            controller
                                                                .getCompletedMyMatchResponse!
                                                                .data[index]
                                                                .team1
                                                                .teamShortName,
                                                            style: TextStyle(
                                                                color: ColorConstant
                                                                    .primaryBlackColor,
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            height: 30,
                                                           // width: 80,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                               ),
                                                            alignment:
                                                                Alignment.center,
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.check_circle_outline,size:13,
                                                                  color: ColorConstant.greenColor,
                                                                ),
                                                                SizedBox(width: 5,),
                                                                Text(
                                                                  "Completed",
                                                                  style: TextStyle(
                                                                      color: ColorConstant
                                                                          .greenColor,
                                                                      fontSize: 12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            controller
                                                                .getCompletedMyMatchResponse!
                                                                .data[index]
                                                                .matchDateTime,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black45,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            controller
                                                                .getCompletedMyMatchResponse!
                                                                .data[index]
                                                                .team2
                                                                .teamShortName,
                                                            style: TextStyle(
                                                                color: ColorConstant
                                                                    .primaryBlackColor,
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                                    Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          controller
                                                                .getCompletedMyMatchResponse!
                                                                .data[index]
                                                                .team2
                                                                .teamImage),
                                      fit: BoxFit.fill)),
                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                            0, 5, 10, 0),
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            controller
                                                                .getCompletedMyMatchResponse!
                                                                .data[index]
                                                                .team1
                                                                .teamName,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black45,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          Text(
                                                            controller
                                                                .getCompletedMyMatchResponse!
                                                                .data[index]
                                                                .team2
                                                                .teamName,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black45,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              height: 1,
                                              color: ColorConstant.deviderColor,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      child: Text(
                                                        "1 Team    1 Contest",
                                                        style: TextStyle(
                                                            color: Colors.black45,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      ),
                                                    ),
                                                  
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                               
                               
                               
                                  ));
                         
                         
                            });
          }),
    );
  }
}
