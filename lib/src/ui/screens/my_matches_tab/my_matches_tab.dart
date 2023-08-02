import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/fantacy_tab.dart';
import 'package:cricket_fantacy/src/ui/widgets/upcomming_matches_card_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
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
  var controller=Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    _secondTabController = TabController(
        length: 3,
        vsync: this); 
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
            // height: MediaQuery.of(context).size.height/5,
            width: MediaQuery.of(context).size.width / 1,
            decoration: const BoxDecoration(
              color: ColorConstant.primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height/10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // width: MediaQuery.of(context).size.width / 4,
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            ImageUitls.Profile_icon,
                            height: 35,
                            width: 35,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          alignment: Alignment.center,
                          child: const Text(
                            "My Matches",
                            style: TextStyle(
                                color: ColorConstant.primaryWhiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 0, right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              _changeTopTab(0);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.sports_cricket_outlined,
                                    size: 20,
                                    color: _tabController == 0
                                        ? ColorConstant.primaryWhiteColor
                                        : Colors.white54),
                                Text(
                                  "Cricket",
                                  style: TextStyle(
                                      color: _tabController == 0
                                          ? ColorConstant.primaryWhiteColor
                                          : Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 60,
                                  height: 5,
                                  color: _tabController == 0
                                      ? ColorConstant.primaryWhiteColor
                                      : ColorConstant.primaryColor,
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _changeTopTab(1);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.sports_football_outlined,
                                    size: 20,
                                    color: _tabController == 1
                                        ? ColorConstant.primaryWhiteColor
                                        : Colors.white54),
                                Text(
                                  "Footbal",
                                  style: TextStyle(
                                      color: _tabController == 1
                                          ? ColorConstant.primaryWhiteColor
                                          : Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 60,
                                  height: 5,
                                  color: _tabController == 1
                                      ? ColorConstant.primaryWhiteColor
                                      : ColorConstant.primaryColor,
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _changeTopTab(2);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.sports_kabaddi,
                                    size: 20,
                                    color: _tabController == 2
                                        ? ColorConstant.primaryWhiteColor
                                        : Colors.white54),
                                Text(
                                  "Kabaddi",
                                  style: TextStyle(
                                      color: _tabController == 2
                                          ? ColorConstant.primaryWhiteColor
                                          : Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 60,
                                  height: 5,
                                  color: _tabController == 2
                                      ? ColorConstant.primaryWhiteColor
                                      : ColorConstant.primaryColor,
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _changeTopTab(3);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.sports_basketball,
                                    size: 20,
                                    color: _tabController == 3
                                        ? ColorConstant.primaryWhiteColor
                                        : Colors.white54),
                                Text(
                                  "Basketball",
                                  style: TextStyle(
                                      color: _tabController == 3
                                          ? ColorConstant.primaryWhiteColor
                                          : Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 60,
                                  height: 5,
                                  color: _tabController == 3
                                      ? ColorConstant.primaryWhiteColor
                                      : ColorConstant.primaryColor,
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _changeTopTab(4);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.sports_esports_outlined,
                                    size: 20,
                                    color: _tabController == 4
                                        ? ColorConstant.primaryWhiteColor
                                        : Colors.white54),
                                Text(
                                  "Hackey",
                                  style: TextStyle(
                                      color: _tabController == 4
                                          ? ColorConstant.primaryWhiteColor
                                          : Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 60,
                                  height: 5,
                                  color: _tabController == 4
                                      ? ColorConstant.primaryWhiteColor
                                      : ColorConstant.primaryColor,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 1,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
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
               Container(),
               Container()
              ],
            ),
          )
        ],
      ),
    );
  }



Widget upcomminMatchTabWidget(){
  return GetBuilder<HomeController>(
    init: HomeController(),
    builder: (controller) {
      return 
      controller.getUpcommingMyMatchResponse==null?Center(
        child: CircularProgressIndicator(color: ColorConstant.primaryColor,),
      ):
      ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: controller.getUpcommingMyMatchResponse!.data.length,
        itemBuilder: (context,index){
        return Padding(
            padding: const EdgeInsets.only(left:15,right: 15,top: 8,bottom: 8),
            child: Container(
          width: MediaQuery.of(context).size.width / 1,
          // height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstant.primaryWhiteColor,
              border: Border.all(width: 1, color: Colors.black26)),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                                controller.getUpcommingMyMatchResponse!.data[index].leagueName,
                                style: TextStyle(
                                    color: ColorConstant.primaryBlackColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.movie_filter_outlined,
                                  size: 18,
                                  color: ColorConstant.deviderColor,
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                "Lineup Out",
                                style: TextStyle(
                                    color: ColorConstant.greenColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                                ],
                              )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                controller.getUpcommingMyMatchResponse!.data[index].team1.teamImage,
                                height: 40,
                                width: 40,
                              ),
                              Text(
                                controller.getUpcommingMyMatchResponse!.data[index].team1.teamShortName,
                                style: TextStyle(
                                    color: ColorConstant.primaryBlackColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12),
                                alignment: Alignment.center,
                                child: Text(
                                  "02h 00m",
                                  style: TextStyle(
                                      color: ColorConstant.primaryColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                               controller.getUpcommingMyMatchResponse!.data[index].matchDateTime,
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                               controller.getUpcommingMyMatchResponse!.data[index].team2.teamShortName,
                                style: TextStyle(
                                    color: ColorConstant.primaryBlackColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.network(
                               controller.getUpcommingMyMatchResponse!.data[index].team2.teamImage,
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                        ],
                      ),
                       Padding(
                  padding: const EdgeInsets.fromLTRB(0,5,10,0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.getUpcommingMyMatchResponse!.data[index].team1.teamName,
                          style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                         controller.getUpcommingMyMatchResponse!.data[index].team2.teamName,
                          style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
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
                    width: MediaQuery.of(context).size.width/1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       
                           Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              "1 Team    1 Contest",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        
                        Image.asset(ImageUitls.Notification_icon,
                          height: 20,
                          width: 20,
                          color: Colors.black,
                          
                         
                         ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      
          );
      });
    }
  );
}


}
