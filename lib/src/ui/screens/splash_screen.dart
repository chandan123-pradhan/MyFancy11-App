import 'dart:async';

import 'package:cricket_fantacy/src/ui/screens/dashboard_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
Timer? _timer;

void _navigateFromThisPage(){
  _timer=Timer(Duration(seconds: 2), () {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return DashboardScreen();
    }));
   });
}

@override
  void dispose() {
    _timer!.cancel();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    _navigateFromThisPage();
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