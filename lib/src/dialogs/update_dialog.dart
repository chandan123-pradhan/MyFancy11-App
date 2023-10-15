import 'dart:io';

import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateDialog extends StatefulWidget {
  String apkUrl;
  UpdateDialog({required this.apkUrl});
  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  var controller = Get.put(HomeController());

  @override
  void initState() {
   
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Container(
        //color: ColorConstant.primaryWhiteColor,
        height: MediaQuery.of(context).size.height / 2.1,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Platform.isIOS
                  ? Text(
                      "Update Available (V${controller.splashDataApiResponse.data.iosVersion})",
                      style: TextStyle(
                          color: ColorConstant.primaryBlackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )
                  : Text(
                      "Update Available (V${controller.splashDataApiResponse.data.androidVersion})",
                      style: TextStyle(
                          color: ColorConstant.primaryBlackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
              SizedBox(
                height: 10,
              ),
              Html(data: controller.splashDataApiResponse.data.updateMsgHtml),
              SizedBox(
                height: 10,
              ),
              Lottie.asset(
                'assets/lotties/update.json',
                height: MediaQuery.of(context).size.height / 4,
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  // Navigator.pop(context);
                  openWeb(widget.apkUrl);
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorConstant.primaryBlackColor),
                  alignment: Alignment.center,
                  child: Text(
                    "UPDATE",
                    style: TextStyle(
                        color: ColorConstant.primaryWhiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openWeb(String url) {
    launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
    );
  }
}
