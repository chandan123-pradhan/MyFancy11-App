import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/models/PlayersModel.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/Leader_baord_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/pick_caption_vice_caption_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/winning_tab_screen.dart';
import 'package:cricket_fantacy/src/ui/widgets/mega_contest_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/multiple_contest_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/steper_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PickPlayerScreen extends StatefulWidget {
  const PickPlayerScreen({super.key});

  @override
  State<PickPlayerScreen> createState() => _PickPlayerScreenState();
}

class _PickPlayerScreenState extends State<PickPlayerScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;


  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 4,
        vsync: this); // Change the length to match the number of tabs
  }

  void _pickPlayer(player){
    playersList.add(player);
    setState(() {
      
    });
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
              "Create Team 1",
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
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
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
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              //   width: MediaQuery.of(context).size.width / 5,
                              // height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Players",
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "0/11",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              // height: 100,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    ImageUitls.Team_2_logo,
                                    height: 40,
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "CSK",
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                            color:
                                                ColorConstant.primaryWhiteColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 5,
                              // height: 100,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "CSK",
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                            color:
                                                ColorConstant.primaryWhiteColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    ImageUitls.Team_2_logo,
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
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Players",
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "0/11",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 11; i++)
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: playersList.length > i
                                          ? ColorConstant.greenColor
                                          : Colors.white70),
                                  width: MediaQuery.of(context).size.width / 15,
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
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: ColorConstant.primaryColor,
                      indicatorWeight: 5,
                      labelColor: ColorConstant.primaryBlackColor,
                      tabs: [
                        Tab(
                          text: 'Vkt(0)',
                        ),
                        Tab(text: "Bat(0)"),
                        Tab(text: 'AR(0)'),
                        Tab(text: 'Bowl(0)'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      playerListWidget(), // Content for Tab 1
                      playerListWidget(), // Content for Tab 2
                      playerListWidget(), // Content for Tab 3
                      playerListWidget() // Content for Tab 3
                    ],
                  ),
                )
              ],
            ),
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
                              "PREVIEW",
                              style: TextStyle(
                                  color: ColorConstant.primaryWhiteColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
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
                       const  SizedBox(
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
                
                child: InkWell(
                  onTap: (){
                  
                  if(playersList.length==11){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const PickCaptionViceCaptionScreen();
                    }));
                  }
                  },
                  child: Container(
                    height: 45,width:100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color:playersList.length==11?ColorConstant.primaryBlackColor: Colors.black12,
                      boxShadow: [
                        BoxShadow(
                          color: 
                          
                          
                          Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child:  Text(
                                "NEXT",
                                style: TextStyle(
                                    color: ColorConstant.primaryWhiteColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                    ),
                  ),
                )),

          ],
        ),
      ),
    );
  }

  void changeIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }

  Widget playerListWidget() {
    return Column(
      children: [
        Container(
          height: 40,
          color: Colors.grey[200],
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
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
            padding: EdgeInsets.only(left: 15, right: 15),
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
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: BoxDecoration(
                      border: Border(
                    top:
                        BorderSide(width: 1, color: ColorConstant.deviderColor),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Container(
                          // width: MediaQuery.of(context).size.width/2.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 70,
                                width: 80,
                                child: Stack(children: [
                                  Image.asset(
                                    "assets/images/virat_kohali_pic.png",
                                    fit: BoxFit.fill,
                                  ),
                                  Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Icon(
                                        Icons.info_outline_rounded,
                                        size: 20,
                                        color: Colors.black54,
                                      ))
                                ]),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Virat Kohali",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Sell by 15.70%",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        size: 10,
                                        color: ColorConstant.primaryBlackColor,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Played Last Match",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 5,
                          alignment: Alignment.center,
                          child: Text(
                            "113",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "7.5",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: (){
                                  _pickPlayer('Virat kohali');
                                },
                                child: Icon(
                                  Icons.add_circle_outline,
                                  size: 20,
                                  color: ColorConstant.greenColor,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
