import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/fantacy_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/winners_tab/contest_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/winners_tab/winner_controller.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/upcomming_matches_card_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class WinnersTab extends StatefulWidget {
  const WinnersTab({super.key});

  @override
  State<WinnersTab> createState() => _WinnersTabState();
}

class _WinnersTabState extends State<WinnersTab>
    with SingleTickerProviderStateMixin {
  int _tabController = 0;

  var winnerController = Get.put(WinnerController());
  @override
  void initState() {
    super.initState();
    winnerController.getWinnerData();
  }

  @override
  void dispose() {
    super.dispose();
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
      body: RefreshIndicator(
        onRefresh: () async {
        winnerController.getWinnerData();
        },
        child: GetBuilder<WinnerController>(
            init: WinnerController(),
            builder: (controller) {
              return controller.winnerApiResponse == null
                  ? shimerEffect(length: 4, context: context)
                  : 
                  winnerController.winnerApiResponse['data'].length==0?Center(
                    child: Text("No Data Found"),
                  ):
                  
                  ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                      itemCount:
                          winnerController.winnerApiResponse['data'].length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 8, bottom: 
                       index==    winnerController.winnerApiResponse['data'].length-1?100:      
                                8
                                
                                
                                
                                ),
                            child: InkWell(
                              onTap: () {
                            
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return ContestScreen(
                                    matchData: winnerController.winnerApiResponse['data'][index],
                                  );
                                }));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1,
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
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  winnerController
                                                              .winnerApiResponse[
                                                          'data'][index]['match']
                                                      ['league_name'],
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
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 40,
                                                      child: Stack(
                                                        children: [
                                                          Visibility(
                                                            visible: winnerController
                                                                                .winnerApiResponse[
                                                                            'data']
                                                                        [
                                                                        index]['match']
                                                                    [
                                                                    'winner_team'] ==
                                                                winnerController
                                                                            .winnerApiResponse[
                                                                        'data'][index]
                                                                    [
                                                                    'match']['teamid1'],
                                                            child: Positioned(
                                                              top: -10,
                                                              left: 0,
                                                              right: 5,
                                                              child: Image.asset(
                                                                'assets/icons/crown.png',
                                                                height: 30,
                                                                width: 20,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 10,
                                                            child: Container(
                                                              height: 35,
                                                              width: 35,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  image: DecorationImage(
                                                                      image: NetworkImage(winnerController.winnerApiResponse['data'][index]['match']['team1']
                                                                              [
                                                                              'team_image'] ??
                                                                          'https://upload.wikimedia.org/wikipedia/commons/e/ef/Virat_Kohli_during_the_India_vs_Aus_4th_Test_match_at_Narendra_Modi_Stadium_on_09_March_2023.jpg'),
                                                                      fit: BoxFit
                                                                          .fill)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                     Text(
                                                  winnerController
                                                              .winnerApiResponse[
                                                          'data'][index]['match']['team1']
                                                      ['team_short_name'],
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .primaryBlackColor,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      winnerController
                                                                  .winnerApiResponse[
                                                              'data'][index]['match']
                                                          ['match_date_time'],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                      Text(
                                                  winnerController
                                                              .winnerApiResponse[
                                                          'data'][index]['match']['team2']
                                                      ['team_short_name'],
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .primaryBlackColor,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(width: 10,),
                                                    Container(
                                                      height: 50,
                                                      width: 40,
                                                      child: Stack(
                                                        children: [
                                                          Visibility(
                                                            visible: winnerController
                                                                                .winnerApiResponse[
                                                                            'data']
                                                                        [
                                                                        index]['match']
                                                                    [
                                                                    'winner_team'] ==
                                                                winnerController
                                                                            .winnerApiResponse[
                                                                        'data'][index]
                                                                    [
                                                                    'match']['teamid2'],
                                                            child: Positioned(
                                                              top: -10,
                                                              left: 0,
                                                              right: 5,
                                                              child: Image.asset(
                                                                'assets/icons/crown.png',
                                                                height: 30,
                                                                width: 20,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 10,
                                                            child: Container(
                                                              height: 35,
                                                              width: 35,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  image: DecorationImage(
                                                                      image: NetworkImage(winnerController.winnerApiResponse['data'][index]['match']['team2']
                                                                              [
                                                                              'team_image'] ??
                                                                          'https://upload.wikimedia.org/wikipedia/commons/e/ef/Virat_Kohli_during_the_India_vs_Aus_4th_Test_match_at_Narendra_Modi_Stadium_on_09_March_2023.jpg'),
                                                                      fit: BoxFit
                                                                          .fill)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    
                                                  ],
                                                ),
                                                
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  0, 5, 10, 0),
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      winnerController
                                                          .winnerApiResponse[
                                                              'data'][index]
                                                              ['match']['title']
                                                          .split(' vs ')
                                                          .first,
                                                      style: const TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      winnerController
                                                          .winnerApiResponse[
                                                              'data'][index]
                                                              ['match']['title']
                                                          .split(' vs ')
                                                          .last,
                                                      style: const TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
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
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Text(
                                                  "Team:- ${index + 1}    ${winnerController.winnerApiResponse['data'][index]['contest_data'].length} Contest",
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
      ),
    );
  }
}
