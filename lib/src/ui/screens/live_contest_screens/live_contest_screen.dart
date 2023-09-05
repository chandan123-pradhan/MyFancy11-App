import 'package:cricket_fantacy/src/controllers/live_contest_controller.dart';
import 'package:cricket_fantacy/src/models/get_my_mateches_api_response.dart';
import 'package:cricket_fantacy/src/ui/screens/live_contest_screens/my_contest_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/live_contest_screens/my_team_widget_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/wallets/wallet_screen.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveContestScreen extends StatefulWidget {
  final String matchId;
  LiveContestScreen({required this.matchId});

  @override
  State<LiveContestScreen> createState() => _LiveContestScreenState();
}

class _LiveContestScreenState extends State<LiveContestScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var controller = Get.put(LiveContestController());
  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    print(widget.matchId);
    controller.getData(widget.matchId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bg_color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.primaryBlackColor,
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
        title: Text(
          "WI vs IND",
          style: TextStyle(
              color: ColorConstant.primaryWhiteColor,
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WalletScreen();
                }));
              },
              child: Icon(
                Icons.help_outline_outlined,
                size: 27,
                color: ColorConstant.primaryWhiteColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WalletScreen();
                  }));
                },
                child: Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "PTS",
                    style: TextStyle(color: Colors.white, fontSize: 9),
                  ),
                )),
          )
        ],
      ),
      body: 
      
       Column(
                    children: [
                     GetBuilder<LiveContestController>(
          init: LiveContestController(),
          builder: (controller) {
            return controller.liveMatchUpdateApiResponse == null
                ? Container(
                  height: MediaQuery.of(context).size.height/3,
                  child: Center(child: Text("Loading"))
                )
                : Container(
                            // height: 225,
                            color: ColorConstant.primaryBlackColor,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.liveMatchUpdateApiResponse![
                                                'data'][0]['team1']['team_name'],
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 16),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          controller.liveMatchUpdateApiResponse![
                                                                      'data'][0]
                                                                  ['team1']
                                                              ['team_image'],
                                                        ),
                                                        fit: BoxFit.fill)),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                controller
                                                        .liveMatchUpdateApiResponse![
                                                    'data'][0]['team1Score'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                controller
                                                        .liveMatchUpdateApiResponse![
                                                    'data'][0]['team1Over'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            controller.liveMatchUpdateApiResponse![
                                                'data'][0]['team2']['team_name'],
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                controller
                                                        .liveMatchUpdateApiResponse![
                                                    'data'][0]['team2Score'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                controller
                                                        .liveMatchUpdateApiResponse![
                                                    'data'][0]['team2Over'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          controller.liveMatchUpdateApiResponse![
                                                                      'data'][0]
                                                                  ['team2']
                                                              ['team_image'],
                                                        ),
                                                        fit: BoxFit.fill)),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Icon(
                                      //   Icons.circle,
                                      //   size: 10,
                                      //   color: Colors.red,
                                      // ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width / 1.3,
                                        child: Text(
                                          controller.liveMatchUpdateApiResponse![
                                              'data'][0]['match_status_note'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Projected score: 73 @ 7.3 RPO",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    color: Colors.white70,
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width /
                                            2.23,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  controller
                                                          .liveMatchUpdateApiResponse![
                                                      'current'][0]['strik']['name'],

                                                  //"Virat Kohali",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                 "${controller
                                                          .liveMatchUpdateApiResponse![
                                                      'current'][0]['strik']['strik_data']['score']} (${controller
                                                          .liveMatchUpdateApiResponse![
                                                      'current'][0]['strik']['strik_data']['ball']})",
                                                
                                              //    "10 (10)",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
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
                                                Text(
                                                  controller.liveMatchUpdateApiResponse![
                                                          'current'][0]['batsman']
                                                      ['fullname'],
                                                  style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "${controller.liveMatchUpdateApiResponse!['current'][0]['batsman']['batsman_data']['score']} (${controller.liveMatchUpdateApiResponse!['current'][0]['batsman']['batsman_data']['ball']})",
                                                  style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width / 2.5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  controller.liveMatchUpdateApiResponse![
                                                          'current'][0]['bowler']
                                                      ['fullname'],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                 "${controller.liveMatchUpdateApiResponse!['current'][0]['bowler']['bowler_data']['wickets']}/${controller.liveMatchUpdateApiResponse!['current'][0]['bowler']['bowler_data']['runs']} (${controller.liveMatchUpdateApiResponse!['current'][0]['bowler']['bowler_data']['overs']})"
                                                 
                                                 
                                               ,  
                                                 
                                                 
                                                //  "0/11 (1.0)",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  for (int i = 0;
                                                      i <
                                                          controller
                                                              .liveMatchUpdateApiResponse![
                                                                  'commentry']
                                                              .length;
                                                      i++)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(
                                                              4, 0, 4, 0),
                                                      child: Container(
                                                        height: 22,
                                                        width: 22,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                              width: 1,
                                                              color: Colors.white),
                                                        ),
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          controller.liveMatchUpdateApiResponse![
                                                                              'commentry']
                                                                          [
                                                                          i]['score']
                                                                      ['out'] ==
                                                                  true
                                                              ? 'W'
                                                              : controller
                                                                  .liveMatchUpdateApiResponse![
                                                                      'commentry']
                                                                      [i]['score']
                                                                      ['runs']
                                                                  .toString(),
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 9),
                                                        ),
                                                      ),
                                                    )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TabBar(
                            isScrollable: true,
                            controller: _tabController,
                            indicatorColor: ColorConstant.primaryColor,
                            indicatorWeight: 3,
                            labelColor: ColorConstant.primaryBlackColor,
                            tabs: [
                              Tab(
                                text:
                                    'My Contest (${controller.myContestApiResponse == null ? '' : controller.myContestApiResponse!.data.length})',
                              ),
                              Tab(text: "My Team (1)"),
                              Tab(text: 'Commentary'),
                              Tab(text: "Scorecard"),
                              Tab(text: 'Stats'),
                              Tab(text: 'My Network'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        
                        child:  TabBarView(
                          
                                controller: _tabController,
                                children: [
                                  MyContestTab(
                                   
                                  ),
                                   MyTeamWidgetTab(
                                    
                                  )
                                ],
                              ),
                      )
                    ],
                  )
        ,
    );
  }
}
