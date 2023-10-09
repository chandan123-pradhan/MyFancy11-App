import 'dart:async';

import 'package:cricket_fantacy/src/controllers/quiz_controller.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/auth_landing_page.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/login_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/home_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/my_matches_tab/my_matches_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/notification_screens/Notification_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/portfolio_screens/portfolio_screens.dart';
import 'package:cricket_fantacy/src/ui/screens/wallets/wallet_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/winners_tab/winners_tab.dart';
import 'package:cricket_fantacy/src/ui/widgets/bottom_bar_item.dart';
import 'package:cricket_fantacy/src/ui/widgets/drawer_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:cricket_fantacy/src/utils/local_storage/shared_prefrences.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class DashboardScreen extends StatefulWidget {
  final int index;
  DashboardScreen({required this.index});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _body = Container();
  var controller = Get.put(HomeController());


  var quizController = Get.put(QuizController());
  void _changeIndex(int value) {
         
    _currentIndex = value;
    _body = _screens[_currentIndex];
    setState(() {});
     quizController.timer!.cancel();
     if(quizController.quizDetailsTimer!.isActive){
      quizController.quizDetailsTimer!.cancel();
     }
  }

  List<Widget> _screens = [
    HomeScreen(),
    MyMatchesTab(),
    WinnersTab(),
    PortfolioScreen()
  ];

  @override
  void initState() {
    
    _body = _screens[widget.index];
    _currentIndex = widget.index;
    controller.getUsersProfile();
    controller.getMatchesApiCall(context);
    callGetMyMatchApi();
   if(widget.index==0 ){
    showFancyCustomDialog(context);
   }
    
    // TODO: implement initState
    super.initState();
  }


   void showFancyCustomDialog(BuildContext context) {
           Timer(Duration(seconds: 2), () {

//              Dialog fancyDialog = Dialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12.0),
//             ), 
//              backgroundColor: Colors.transparent,
//              elevation: 0,
//             child: Container(


//                 decoration: BoxDecoration(
//                   color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 height:MediaQuery.of(context).size.height/1.5,
//                 width: MediaQuery.of(context).size.width/1,
//                 child: Stack(
//                 children: <Widget>[

// Positioned(

//   top: 10,
//   right: 10,
//   child:   Container(
  
  
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                   borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   height:MediaQuery.of(context).size.height/1.4,
//                   width: MediaQuery.of(context).size.width/1,

// child: Image.network(controller.splashDataApiResponse.data.homePagePopup,
// fit: BoxFit.fill,
// ),


//   ),
// ),

//                     Positioned(
//                       top: 0,
//                       right: 0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: ColorConstant.primaryColor,
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Icon(Icons.clear_outlined,size:20,color: Colors.white,),
//                         )),
//                     ),

             
//                 ],
//                 ),
//             ),
//             );
//     showDialog(
//         context: context, builder: (BuildContext context) => fancyDialog);

showDialog(
  context: context,
  builder: (_) => new AlertDialog(
    backgroundColor: Colors.transparent,
     insetPadding: EdgeInsets.only(left: 10,right: 10),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
  shape: RoundedRectangleBorder(
    borderRadius:
      BorderRadius.all(
        Radius.circular(10.0))),
    content: Builder(
      builder: (context) {
        // Get available height and width of the build area of this widget. Make a choice depending on the size.                              
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;

        return Container(


                decoration: BoxDecoration(
                  color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
                ),
                height:MediaQuery.of(context).size.height/1.5,
                width: MediaQuery.of(context).size.width/1,
                child: Stack(
                children: <Widget>[

Positioned(

  top: 10,
  right: 10,
  left: 10,
  child:   Container(
  
  
                  decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  ),
                  height:MediaQuery.of(context).size.height/1.4,
                  width: MediaQuery.of(context).size.width/1,

child: Image.network(controller.splashDataApiResponse.data.homePagePopup,
fit: BoxFit.fill,
),


  ),
),

                    Positioned(
                      top: 0,
                      right: 0,
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConstant.primaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.clear_outlined,size:20,color: Colors.white,),
                          )),
                      ),
                    ),

             
                ],
                ),
            );
      },
    ),
  )
);


             });



}

  void callGetMyMatchApi() async {
    await controller.getMyMatch(context, 'fixture');
    // await controller.getMyMatch(context, 'live');
    // await controller.getMyMatch(context, 'completed');
  }

  @override
  Widget build(BuildContext context) {
    // showFancyCustomDialog(context);
    return Scaffold(
      key: _scaffoldKey,
      body: _body,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: ColorConstant.primaryColor,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              size: 25,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Image.asset(
            ImageUitls.App_Logo,
            height: 40,
          ),
          actions: [
            InkWell(
              onTap: () {
                if (logInStatus) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NotificationScreen();
                  }));
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                }
              },
              child: Container(
                width: 30,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    child: Image.asset(
                      ImageUitls.Notification_icon,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                if (logInStatus == true) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WalletScreen();
                  }));
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                }
              },
              child: Container(
width: 30,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    ImageUitls.Wallet_icon,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
      bottomSheet: 
      logInStatus?
      
      BottomAppBar(
        elevation: 0,
        height: 70,
        color: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
            color: ColorConstant.primaryWhiteColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 1),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _changeIndex(0);
                    quizController.timer!.cancel();
                    //quizController.quizDetailsTimer!.cancel();
                  },
                  child: BottomBarItem(
                    imageName: ImageUitls.UnSelected_home,
                    title: 'Home', 
                    isSelected: _currentIndex == 0 ? true : false,
                    selectedImage: ImageUitls.Selected_home,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _changeIndex(1);
                    quizController.timer!.cancel();
                    // quizController.quizDetailsTimer!.cancel();
                  },
                  child: BottomBarItem(
                    imageName: 'assets/new_icons/match_not.png',
                    title: 'My Matches',
                    isSelected: _currentIndex == 1 ? true : false,
                     selectedImage: 'assets/new_icons/match.png'
                  ),
                ),
                InkWell(
                    onTap: () {
                      _changeIndex(2);
                      quizController.timer!.cancel();
                      //   quizController.quizDetailsTimer!.cancel();
                    },
                    child: BottomBarItem(
                      imageName: ImageUitls.UnSelected_winners,
                      title: 'Winners',
                      isSelected: _currentIndex == 2 ? true : false,
                        selectedImage: 'assets/new_icons/winner.png'
                    )),
                InkWell(
                    onTap: () {
                      _changeIndex(3);
                    },
                    child: BottomBarItem(
                      imageName: ImageUitls.Profile_icon,
                      title: 'Trading',
                      isSelected: _currentIndex == 3 ? true : false,
                      selectedImage: 'assets/new_icons/quiz.png'
                    ))
              ],
            ),
          ),
        ),
      )
   
   :Container(
    height: 0,
   )
   
    );
  }
}
