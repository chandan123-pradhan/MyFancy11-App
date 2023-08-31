import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/models/GetContestListApiResponse.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/models/PlayersModel.dart';
import 'package:cricket_fantacy/src/models/get_squad_api_response.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/Leader_baord_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/pick_caption_vice_caption_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/team_preview_page.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/winning_tab_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/wallets/wallet_screen.dart';
import 'package:cricket_fantacy/src/ui/widgets/mega_contest_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/multiple_contest_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/steper_widget.dart';
import 'package:cricket_fantacy/src/utils/app_constant.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PickPlayerScreen extends StatefulWidget {
  final Matches matches;
  final Contest contest;
  PickPlayerScreen({required this.matches, required this.contest});

  @override
  State<PickPlayerScreen> createState() => _PickPlayerScreenState();
}

class _PickPlayerScreenState extends State<PickPlayerScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;
  var controller = Get.put(HomeController());

  void callGetWinningInfo() {
    controller.getSquad(context, widget.contest.matchId);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 4,
        vsync: this); // Change the length to match the number of tabs
   _calculateTimeRemaining();
    callGetWinningInfo();
  }



  var targetDate;

  _calculateTimeRemaining() {
    DateTime now = DateTime.now();
    targetDate =
        DateFormat("yyyy-MM-dd hh:mm:ss").parse(widget.matches.matchDateTime);
    Duration remainingDuration = targetDate.difference(now);

    int hours = remainingDuration.inHours;
    int minutes = remainingDuration.inMinutes.remainder(60);
    print('$hours hours and $minutes minutes remaining');
    //return '';
    setState(() {});
  }


  void _pickPlayer(player) {
    playersList.add(player);
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List playersList = [];

  void addPlayers(PalyerModel player) {
    playersList.add(player);
    setState(() {});
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Team",
              style: TextStyle(
                  color: ColorConstant.primaryWhiteColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            CountdownTimer(
              endWidget: Text("Live"),
              endTime: targetDate.millisecondsSinceEpoch,
              textStyle: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return WalletScreen();
                                  }));
              },
              child: Image.asset(
                ImageUitls.Wallet_icon,
                height: 20,
                width: 20,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GetBuilder<HomeController>(
                init: HomeController(),
                builder: (controller) {
                  return controller.getSquadApiResponse == null
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: ColorConstant.primaryColor,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 8,
                              color: ColorConstant.primaryBlackColor,
                            ),
                            StepperWidget(
                              step: 3,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1,
                              color: ColorConstant.primaryBlackColor,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    "Maximum of 10 players from one team",
                                    style: TextStyle(
                                        color: ColorConstant.primaryWhiteColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          //   width: MediaQuery.of(context).size.width / 5,
                                          // height: 100,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children:  [
                                              Text(
                                                "Players",
                                                style: TextStyle(
                                                    color: Colors.white54,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "${controller.team1ChoosedPlayers.length}/11",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          // height: 100,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.network(
                                                widget.matches.team1.teamImage,
                                                height: 40,
                                                width: 40,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    widget.matches.team1
                                                        .teamShortName,
                                                    style: TextStyle(
                                                        color: Colors.white54,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  // Text(
                                                  //   widget.matches.team1.,
                                                  //   style: TextStyle(
                                                  //       color:
                                                  //           ColorConstant.primaryWhiteColor,
                                                  //       fontSize: 13,
                                                  //       fontWeight: FontWeight.w600),
                                                  // ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          // height: 100,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    widget.matches.team2
                                                        .teamShortName,
                                                    style: TextStyle(
                                                        color: Colors.white54,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  // Text(
                                                  //   "0",
                                                  //   style: TextStyle(
                                                  //       color:
                                                  //           ColorConstant.primaryWhiteColor,
                                                  //       fontSize: 13,
                                                  //       fontWeight: FontWeight.w600),
                                                  // ),
                                                ],
                                              ),
                                              Image.network(
                                                widget.matches.team2.teamImage,
                                                height: 40,
                                                width: 40,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // width: MediaQuery.of(context).size.width / 5,
                                          // height: 100,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Players",
                                                style: TextStyle(
                                                    color: Colors.white54,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                 "${controller.team2ChoosedPlayers.length}/11",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        for (int i = 0; i < 11; i++)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2.0),
                                            child: Container(
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .choosedPlayerList
                                                              .length >
                                                          i
                                                      ? ColorConstant.greenColor
                                                      : Colors.white70),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  15,
                                            ),
                                          ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.remove_circle_outline,
                                          size: 20,
                                          color: Colors.white54,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    color: Colors.white38,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Pitch Balanced",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Icon(
                                          Icons.circle,
                                          size: 6,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Good for Pace",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Icon(
                                          Icons.circle,
                                          size: 6,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Avg Score 129",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Icon(
                                          Icons.circle,
                                          size: 6,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Venue Salem",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: TabBar(
                                  controller: _tabController,
                                  indicatorColor: ColorConstant.primaryColor,
                                  indicatorWeight: 5,
                                  labelColor: ColorConstant.primaryBlackColor,
                                  tabs: [
                                    Tab(
                                      text:
                                          'Vkt(${controller.choosedWiketKeeperList.length})',
                                    ),
                                    Tab(
                                        text:
                                            "Bat(${controller.choosedBatsManList.length})"),
                                    Tab(
                                        text:
                                            'AR(${controller.choosedAllRounderList.length})'),
                                    Tab(
                                        text:
                                            'Bowl(${controller.choosedBowlerlist.length})'),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  playerListWidget(
                                      designation: AppConstant
                                          .wicketKeeper), // Content for Tab 1
                                  playerListWidget(
                                      designation: AppConstant
                                          .batsMan), // Content for Tab 2
                                  playerListWidget(
                                      designation: AppConstant
                                          .allRownder), // Content for Tab 3
                                  playerListWidget(
                                      designation: AppConstant
                                          .bowler) // Content for Tab 3
                                ],
                              ),
                            )
                          ],
                        );
                }),
            Positioned(
                bottom: 10,
                left: 20,
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.black87,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return TeamPreviewPage();
                            }));
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.remove_red_eye,
                                size: 20,
                                color: ColorConstant.primaryWhiteColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "PREVIEW",
                                style: TextStyle(
                                    color: ColorConstant.primaryWhiteColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "/",
                          style: TextStyle(
                              color: Colors.white38,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.remove_red_eye,
                              size: 20,
                              color: ColorConstant.primaryWhiteColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "LINEUP",
                              style: TextStyle(
                                  color: ColorConstant.primaryWhiteColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
                bottom: 10,
                right: 20,
                child: GetBuilder<HomeController>(
                    init: HomeController(),
                    builder: (controller) {
                      return InkWell(
                        onTap: () {
                          if (controller.choosedPlayerList.length == 11) {
                            if(controller.choosedAllRounderList.isEmpty){
                              Messages().showErrorMsg(context: context, message: 'Minimum 1 Player Should be choose From Allrounders');
                            }
                            else if(controller.choosedBatsManList.isEmpty){
                              Messages().showErrorMsg(context: context, message: 'Minimum 1 Player should be choose from Batsmans');
                            }else 
                            if(controller.choosedBowlerlist.isEmpty ){
                              Messages().showErrorMsg(context: context, message: 'Minimum 1 Player should be choose from Bowllers');
                            }else 
                            if(controller.choosedWiketKeeperList.isEmpty){
                              Messages().showErrorMsg(context: context, message: 'Minimum 1 Player should be choose from Wicketkeepers');
                            }
                            else if(controller.team1ChoosedPlayers.isEmpty || controller.team2ChoosedPlayers.isEmpty){
                              Messages().showErrorMsg(context: context, message: 'Minimum 1 Player should be choose from each team');
                            }
                            
                            else{
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return PickCaptionViceCaptionScreen(
                                contest: widget.contest,
                                matches: widget.matches,
                              );
                            }));
                            }
                          }
                        },
                        child: Container(
                          height: 45,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: controller.choosedPlayerList.length == 11
                                ? ColorConstant.primaryBlackColor
                                : Colors.black12,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            child: Text(
                              "NEXT",
                              style: TextStyle(
                                  color: ColorConstant.primaryWhiteColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }

  void changeIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }

  Widget playerListWidget({required String designation}) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          List<SquadPlayer> players = [];
          var dummyPlayer = [];
          switch (designation) {
            case AppConstant.allRownder:
              players = controller.allRounderList;
              dummyPlayer = controller.dummyallRounderList;
              break;
            case AppConstant.batsMan:
              players = controller.batsManList;
              dummyPlayer = controller.dummyBatsManList;
              break;
            case AppConstant.bowler:
              players = controller.bowlerlist;
              dummyPlayer = controller.dummybowlerlist;
              break;
            case AppConstant.wicketKeeper:
              players = controller.wiketKeeperList;
              dummyPlayer = controller.dummywiketKeeperList;
              break;
          }
          return Column(
            children: [
              Container(
                height: 40,
                color: Colors.grey[200],
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select 1 - 8 Wicket- Keepers",
                        style: TextStyle(
                            color: ColorConstant.primaryBlackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.filter_alt_rounded,
                        size: 30,
                        color: Colors.black45,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 40,
                // color: Colors.grey[200],
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SELECTED BY",
                        style: TextStyle(
                            color: ColorConstant.primaryBlackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.edit,
                                size: 15,
                                color: Colors.blue[200],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "POINTS",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "CREDIT",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.download_sharp,
                                size: 18,
                                color: Colors.black54,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: dummyPlayer.isEmpty == true || players.isEmpty == true
                    ? Center()
                    : ListView.builder(
                        itemCount: players.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (dummyPlayer[index] == 0) {
                                if (controller.choosedPlayerList.length < 11) {
                                  controller.chosedPlayer(
                                      players[index], index,
                                      
                                      widget.matches.team1.teamId,
                                      widget.matches.team2.teamId,
                                      context
                                      );
                                } else {
                                  print("player full");
                                }
                              } else {
                                controller.removeChosedPlayer(
                                    players[index], index,
                                     widget.matches.team1.teamId,
                                      widget.matches.team2.teamId
                                    );
                                //for remove
                              }
                            },
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width / 1,
                              decoration: BoxDecoration(
                                  border: Border(
                                top: BorderSide(
                                    width: 1,
                                    color: ColorConstant.deviderColor),
                              )),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 0),
                                child: Row(
                                  children: [
                                    Container(
                                      // width: MediaQuery.of(context).size.width/2.2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 70,
                                            width: 80,
                                            child: Stack(children: [
                                              Image.network(
                                                players[index].image,
                                                fit: BoxFit.fill,
                                              ),
                                              Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child:                                               Image.network(
                                               players[index].teamImage,
                                                height: 20,
                                                width: 20,
                                              ),)
                                            ]),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                players[index].name,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Sell by 15.70%",
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.circle_rounded,
                                                    size: 10,
                                                    color: ColorConstant
                                                        .primaryBlackColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    //players[index].
                                                                
                                                    players[index]
                                                                .lastMachPlayed ==
                                                            '0'
                                                        ? 'Not Played Last Match'
                                                        : "Played Last Match",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 6,
                                      alignment: Alignment.center,
                                      child: Text(
                                        players[index].playerPoints,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Expanded(
                                      // width: MediaQuery.of(context).size.width / 6,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            players[index].creditPoints,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),

                                          dummyPlayer[index] == 0
                                              ? Icon(
                                                  Icons.add_circle_outline,
                                                  size: 20,
                                                  color: controller
                                                              .choosedPlayerList
                                                              .length ==
                                                          11
                                                      ? ColorConstant
                                                          .disableColor
                                                      : ColorConstant
                                                          .greenColor,
                                                )
                                              : const Icon(
                                                  Icons
                                                      .remove_circle_outline_outlined,
                                                  size: 20,
                                                  color: ColorConstant
                                                      .disableColor,
                                                ),

                                          // SizedBox(
                                          //       width: 15,
                                          //     ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
              ),
            ],
          );
        });
  }
}
