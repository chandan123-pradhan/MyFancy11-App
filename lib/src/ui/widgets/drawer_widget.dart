import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/auth_landing_page.dart';
import 'package:cricket_fantacy/src/ui/screens/profile_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/transaction_history_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/upcomming_feature_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/local_storage/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/instance_manager.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  var controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              logInStatus == true
                  ? Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width / 1,
                      color: ColorConstant.primaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: ColorConstant.primaryWhiteColor,
                              shape: BoxShape.circle,
                            ),
                            child: CachedNetworkImage(
                              imageUrl: controller.profilePicUrl,
                              imageBuilder:(context, imageProvider) {
                                
                                return Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: 
                                    NetworkImage(controller.profilePicUrl),
                                    fit: BoxFit.fill
                                    )
                                  ),
                                );
                              },
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                          userName,
                            style: TextStyle(
                                color: ColorConstant.primaryWhiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                           Text(
                          userEmail,
                            style: TextStyle(
                                color: ColorConstant.primaryWhiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    )
                  : Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width / 1,
                      color: ColorConstant.primaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: ColorConstant.primaryWhiteColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.person_2_outlined, size: 45)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Guest",
                            style: TextStyle(
                                color: ColorConstant.primaryWhiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.home_outlined,
                            size: 25,
                            color: ColorConstant.primaryBlackColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Icon(
                        Icons.navigate_next_sharp,
                        size: 25,
                        color: ColorConstant.primaryBlackColor,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
                InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const TransactionHistoryPage();
                  }));
                //  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.list_alt_outlined,
                            size: 25,
                            color: ColorConstant.primaryBlackColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Transaction History",
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Icon(
                        Icons.navigate_next_sharp,
                        size: 25,
                        color: ColorConstant.primaryBlackColor,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UpcommingFeatureScreen();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.settings_outlined,
                            size: 25,
                            color: ColorConstant.primaryBlackColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Settings",
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Icon(
                        Icons.navigate_next_sharp,
                        size: 25,
                        color: ColorConstant.primaryBlackColor,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
           

  InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfileScreen();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.person_2_outlined,
                            size: 25,
                            color: ColorConstant.primaryBlackColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Icon(
                        Icons.navigate_next_sharp,
                        size: 25,
                        color: ColorConstant.primaryBlackColor,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
           

           logInStatus==false?
             InkWell(
                onTap: () {
                 
                  // Get.deleteAll();
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return AuthLandingPage();
                  }), (route) => false);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.logout,
                            size: 25,
                            color: ColorConstant.primaryBlackColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Icon(
                        Icons.navigate_next_sharp,
                        size: 25,
                        color: ColorConstant.primaryBlackColor,
                      ),
                    ],
                  ),
                ),
              ):
           
              InkWell(
                onTap: () {
                  SharedPref sharedPref = new SharedPref();
                  sharedPref.logout();
                  // Get.deleteAll();
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return AuthLandingPage();
                  }), (route) => false);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.logout,
                            size: 25,
                            color: ColorConstant.primaryBlackColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Icon(
                        Icons.navigate_next_sharp,
                        size: 25,
                        color: ColorConstant.primaryBlackColor,
                      ),
                    ],
                  ),
                ),
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
