import 'dart:developer';

import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';

class ScoreCardScreen extends StatefulWidget {
  var scorecard;
  String team1Name;
  String team2Name;
  var liveMatchData;
  ScoreCardScreen(
      {required this.scorecard,
      required this.team1Name,
      required this.team2Name,
      required this.liveMatchData});

  @override
  State<ScoreCardScreen> createState() => _ScoreCardScreenState();
}

class _ScoreCardScreenState extends State<ScoreCardScreen> {
  List firstIningBatsmanList = [];
  List firstIningBowlerList = [];
  List secondIningBatsmanList = [];
  List secondIningBowlerList = [];
int firstiningId=0;
int secondIningId=0;
  int teamTab = 0;
  @override
  void initState() {
    classifyLists();
    
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    firstIningBatsmanList.clear();
    firstIningBowlerList.clear();
    secondIningBatsmanList.clear();
    secondIningBowlerList.clear();
    // TODO: implement dispose
    super.dispose();
  }

  void classifyLists() {
    firstIningBatsmanList.clear();
    firstIningBowlerList.clear();
    secondIningBatsmanList.clear();
    secondIningBowlerList.clear();
    for (int i = 0; i < widget.scorecard['batting'].length; i++) {
      if (widget.scorecard['batting'][i]['scoreboard'] == 'S1') {
        firstIningBatsmanList.add(widget.scorecard['batting'][i]);
      } else if (widget.scorecard['batting'][i]['scoreboard'] == 'S2') {
        secondIningBatsmanList.add(widget.scorecard['batting'][i]);
      }
    }
    // debugger();
    print(firstIningBatsmanList);
    print(secondIningBatsmanList);
    for (int i = 0; i < widget.scorecard['bowling'].length; i++) {
      if (widget.scorecard['bowling'][i]['scoreboard'] == 'S1') {
        firstIningBowlerList.add(widget.scorecard['bowling'][i]);
      } else {
        secondIningBowlerList.add(widget.scorecard['bowling'][i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Scorecard",
                  style: TextStyle(
                      color: ColorConstant.primaryBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (teamTab != 0) {
                          setState(() {
                            teamTab = 0;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorConstant.bandColor),
                            color: teamTab == 0
                                ? ColorConstant.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                          child: Text(
                            "1st Ining",
                            style: TextStyle(
                                color: teamTab == 0
                                    ? ColorConstant.primaryWhiteColor
                                    : ColorConstant.primaryBlackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        if (teamTab != 1) {
                          setState(() {
                            teamTab = 1;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorConstant.bandColor),
                            color: teamTab == 1
                                ? ColorConstant.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                          child: Text(
                            "2nd Ining",
                            style: TextStyle(
                                color: teamTab == 1
                                    ? ColorConstant.primaryWhiteColor
                                    : ColorConstant.primaryBlackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
                child: Container(
                    child: teamTab == 0
                        ? teamWiseWidget(firstIningBatsmanList, firstIningBowlerList,
                        '${widget.liveMatchData['data'][0]['team1Score']} (${widget.liveMatchData['data'][0]['team1Over']} OVR)',
                        
                        )
                        : teamWiseWidget(secondIningBatsmanList, secondIningBowlerList,
                        
                        '${widget.liveMatchData['data'][0]['team2Score']} (${widget.liveMatchData['data'][0]['team2Over']} OVR)',
                        )))
          ],
        ),
      ),
    );
  }

  Widget teamWiseWidget(List batList, List bowList,
  String score
  ) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1,
              height: 40,
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        'BATSMAN',
                        style: TextStyle(
                            color: ColorConstant.primaryBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      score,
                      style: TextStyle(
                          color: ColorConstant.primaryBlackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Text(
                    "PLAYER",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 9,
                  child: Text(
                    "R",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 9,
                  child: Text(
                    "B",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 9,
                  child: Text(
                    "4S",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  //   color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 9,
                  child: Text(
                    "6S",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 8,
                  child: Text(
                    "SR",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            for (int i = 0; i < batList.length; i++)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Text(
                          batList[i]['player_name'],
                          style: TextStyle(
                              color: ColorConstant.primaryBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 9,
                        child: Text(
                          "${batList[i]['r']}",
                          style: TextStyle(
                              color: ColorConstant.primaryBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 9,
                        child: Text(
                          "${batList[i]['b']}",
                          style: TextStyle(
                              color: ColorConstant.primaryBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        // color: Colors.blue,
                        width: MediaQuery.of(context).size.width / 9,
                        child: Text(
                          "${batList[i]['4s']}",
                          style: TextStyle(
                              color: ColorConstant.primaryBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        //   color: Colors.blue,
                        width: MediaQuery.of(context).size.width / 9,
                        child: Text(
                          "${batList[i]['6s']}",
                          style: TextStyle(
                              color: ColorConstant.primaryBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        // color: Colors.blue,
                        width: MediaQuery.of(context).size.width / 8,
                        child: Text(
                          "${batList[i]['rate']}",
                          style: TextStyle(
                              color: ColorConstant.primaryBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
      
     ,   SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.09,
              height: 40,
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        ' BOWLER',
                        style: TextStyle(
                            color: ColorConstant.primaryBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      score,
                      style: TextStyle(
                          color: ColorConstant.primaryBlackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

    Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Text(
                    "PLAYER",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 10,
                  child: Text(
                    "O",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 10,
                  child: Text(
                    "M",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 10,
                  child: Text(
                    "R",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  //   color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 10,
                  child: Text(
                    "W",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 10,
                  child: Text(
                    "NB",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 10,
                  child: Text(
                    "WD",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 11,
                  child: Text(
                    "ECO",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            for (int i = 0; i < bowList.length; i++)
              Column(
                children: [
                 Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Text(
                    bowList[i]['player_name'],
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 10,
                  child: Text(
                     "${bowList[i]['o']}",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 10,
                  child: Text(
                     "${bowList[i]['m']}",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 10,
                  child: Text(
                    "${bowList[i]['r']}",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  //   color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 10,
                  child: Text(
 "${bowList[i]['w']}",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 10,
                  child: Text(
                   "${bowList[i]['nb']}",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 10,
                  child: Text(
                    "${bowList[i]['wd']}",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 11,
                  child: Text(
                    "${bowList[i]['eco']}",
                    style: TextStyle(
                        color: ColorConstant.primaryBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
   
                
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
      
           , 
             SizedBox(
                    height: 40,
                  ), 
      
      
          ],
        ),
      ),
    );
  }
}
