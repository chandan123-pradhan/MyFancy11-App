import 'dart:io';

import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class maintainanceDialog extends StatefulWidget {
  @override
  State<maintainanceDialog> createState() => _maintainanceDialogState();
}

class _maintainanceDialogState extends State<maintainanceDialog> {
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
        height: MediaQuery.of(context).size.height / 2.3,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lotties/maintainance.json',
                height: MediaQuery.of(context).size.height / 3,
              ),
              SizedBox(
                height: 10,
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
