import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/models/PlayersModel.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/Leader_baord_tab.dart';
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

class _PickPlayerScreenState extends State<PickPlayerScreen> with SingleTickerProviderStateMixin{
  int _currentIndex = 0;
late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Change the length to match the number of tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


List<PalyerModel>playersList=[];


void addPlayers(PalyerModel player){
  playersList.add(player);
  setState(() {
    
  });
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
      body: Column(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      color: ColorConstant.primaryWhiteColor,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      color: ColorConstant.primaryWhiteColor,
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


SizedBox(height: 20,),

                Container(
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(int i=0;i<11;i++)
                      Padding(
                        padding: const EdgeInsets.only(left:2.0),
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color:
                            playersList.length>i?
                             ColorConstant.greenColor:Colors.white70
                          ),
                          width: MediaQuery.of(context).size.width/15,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Icon(Icons.remove_circle_outline,size: 20,color: Colors.white54,)
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Divider(
                  color: Colors.white38,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15,right: 15),
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
                              Icon(Icons.circle,size: 6,color: Colors.white,),
                              Text(
                                "Good for Pace",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              ),
                               Icon(Icons.circle,size: 6,color: Colors.white,),
                              Text(
                                "Avg Score 129",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              ),
                               Icon(Icons.circle,size: 6,color: Colors.white,),
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
                SizedBox(height: 10,),




              ],
            ),
          ),

Container(
  child: Padding(
    padding: const EdgeInsets.only(left:15,right: 15),
    child: TabBar(
            controller: _tabController,
          indicatorColor: ColorConstant.primaryColor,
          indicatorWeight: 5,
         labelColor: ColorConstant.primaryBlackColor,
            tabs: [
              Tab(text: 'Vkt(0)',
              
              
              
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
          Container(color: Colors.red), // Content for Tab 1
          Container(color: Colors.green), // Content for Tab 2
          Container(color: Colors.blue), // Content for Tab 3
            Container(color: Colors.blue), // Content for Tab 3
        ],
      ),
)

        ],
      ),
    );
  }

  void changeIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }


Widget playerListWidget(){
  return ListView.builder(itemBuilder: (context,index){
    
  });
}


}
