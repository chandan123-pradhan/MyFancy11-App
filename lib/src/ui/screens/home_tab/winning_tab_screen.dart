import 'dart:async';

import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class WinningTab extends StatefulWidget {
  String contestId;
  WinningTab({required this.contestId});

  @override
  State<WinningTab> createState() => _WinningTabState();
}

class _WinningTabState extends State<WinningTab> {
  var controller =Get.put(HomeController());
@override
  void initState() {
    controller.getWinningInfo(context, widget.contestId);
    updateLive();
    // TODO: implement initState
    super.initState();
  }




Timer? _t;
void updateLive(){
  print("winer tab timer start");
  _t=Timer.periodic((Duration(seconds: 5)), (timer) { 
   controller.getWinningInfo(context, widget.contestId);
  });
}

@override
  void dispose() {

    _t!.cancel();
    print("Winner timer cancle");
    controller.getWinningInfoApiResponse=null;
    // TODO: implement dispose
    super.dispose();
  }
 



  @override
  Widget build(BuildContext context) {
    return   RefreshIndicator(
        onRefresh: () async {
       controller.getWinningInfo(context, widget.contestId);
        },
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return 
    
    
    controller.getWinningInfoApiResponse==null?
          
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
                      Text("Rank",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54
                      ),
                      
                      
                      ),
                       Text("Winnings",
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
      child: controller.getWinningInfoApiResponse==null?const Center(
      child: CircularProgressIndicator(color: ColorConstant.primaryColor),
      ): SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column
          (
            children: [
              for(int i=0;i<controller.getWinningInfoApiResponse!.data.length;i++)
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${controller.getWinningInfoApiResponse!.data[i].rank}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorConstant.primaryBlackColor
                        ),
                        
                        
                        ),
                         Text("₹${controller.getWinningInfoApiResponse!.data[i].price}",
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
      ),
    );
  }
}