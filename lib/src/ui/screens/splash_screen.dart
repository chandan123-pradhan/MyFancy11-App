import 'dart:async';

import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/auth_landing_page.dart';
import 'package:cricket_fantacy/src/ui/screens/dashboard_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
 var controller=Get.put(HomeController()); 




  @override
  void initState() {
    controller.getSplashData(context,1);
    
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor,
      body: Center(child: 
      Image.asset(ImageUitls.Logo,
      height: 200,
      )
      ),
    );
  }
}