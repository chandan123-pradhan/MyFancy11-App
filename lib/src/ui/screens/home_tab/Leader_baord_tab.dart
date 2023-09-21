import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class LeaderboardTab extends StatefulWidget {
  String contestId;
  LeaderboardTab({required this.contestId});

  @override
  State<LeaderboardTab> createState() => _LeaderboardTabState();
}

class _LeaderboardTabState extends State<LeaderboardTab> {

var controller =Get.put(HomeController());

@override
  void initState() {
    controller.getLeaderBoardResponse(context, widget.contestId);
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return 
        controller.getLeaderboardApiResponse==null?
        
        shimerEffect(length: 3,context: context)
        :
        Column(
          children: [
            SizedBox(height: 10,),
            Container(
              height: 40,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left:15.0),
                child: Text("Be the first in your network to join this contest",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54
                ),
                
                
                ),
              ),
            ),
          //  Divider(),
            Container(
               decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,color: Colors.black12
                ),
                top: BorderSide(
                  width: 1,color: Colors.black12
                )
              )
            ),
            height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left:15.0,right: 15,top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("All Teams (${controller.getLeaderboardApiResponse!.data.length})",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54
                    ),
                    
                    
                    ),
                    
                  ],
                ),
              ),
            ),
            

Expanded(
  child: 
  
  controller.getLeaderboardApiResponse!.data.isEmpty?Center(
    child: Text("Leaderboard data not found"),
  ):
  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column
        (
          children: [
            for(int i=0;i< controller.getLeaderboardApiResponse!.data.length ;i++)
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,color: Colors.black12
                  )
                )
              ),
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left:15.0,right: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Image.network(
                      controller.getLeaderboardApiResponse!.data[i].profile,
                      //'https://img.freepik.com/free-icon/woman_318-157570.jpg',
                    //color: ColorConstant.primaryColor,
                    fit: BoxFit.cover,
                    height: 30,
                    width: 30,
                    ),
                    SizedBox(width: 20,),
                       Text(
                        controller.getLeaderboardApiResponse!.data[i].name
                        ,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorConstant.primaryBlackColor
                      ),
                      
                      
                      ),
                    ],
                  ),
              ),
            )
          ],
        ),
  )
  
  
  )

          ],
        );
      }
    );
  }
}