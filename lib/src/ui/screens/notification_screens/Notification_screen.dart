import 'package:cricket_fantacy/src/controllers/notification_controller.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/models/GetContestListApiResponse.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/ui/screens/dashboard_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/my_matches_tab/my_matches_tab.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _isActive = false;

  var controller = Get.put(NotificationController());

  void getNotification() {
    controller.getNotification();
  }

  @override
  void initState() {
    getNotification();
    // TODO: implement initState
    super.initState();
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
        title: Text(
          "Notifications",
          style: TextStyle(
              color: ColorConstant.primaryWhiteColor,
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),

        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20.0),
        //     child: Image.asset(
        //       ImageUitls.Wallet_icon,
        //       height: 20,
        //       width: 20,
        //     ),
        //   )
        // ],
      ),
      body: GetBuilder<NotificationController>(
          init: NotificationController(),
          builder: (controller) {
            return controller.getNotificationApiResponse == null
                ? const Center(
                    child: CircularProgressIndicator(
                      color: ColorConstant.primaryColor,
                    ),
                  )
                : ListView.builder(
                    itemCount:
                        controller.getNotificationApiResponse!.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Container(
                        //  height: 100,
                          width: MediaQuery.of(context).size.width / 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: ColorConstant.deviderColor)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.getNotificationApiResponse!
                                      .data[index].title,
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5,),
                                 Container(
                                  width: MediaQuery.of(context).size.width/1,
                                   child: Text(
                                    controller.getNotificationApiResponse!
                                        .data[index].htmlDesc,
                                        maxLines: 10,
                                        
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                                                 ),
                                 ),
                               SizedBox(height: 5,),
                                 Container(
                                  alignment: Alignment.centerRight,
                                   child: Text(
                                    controller.getNotificationApiResponse!
                                        .data[index].date,
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                                                 ),
                                 ),  
                              ],
                            ),
                          ),
                        ),
                      );
                    });
          }),
    );
  }
}
