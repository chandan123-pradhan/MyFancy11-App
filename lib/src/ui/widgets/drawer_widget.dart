import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/auth_landing_page.dart';
import 'package:cricket_fantacy/src/ui/screens/home_tab/profile_page.dart';
import 'package:cricket_fantacy/src/ui/screens/profile_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/refer_and_earn_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/transaction_history_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/upcomming_feature_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/wallets/wallet_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/local_storage/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/instance_manager.dart';
import 'package:url_launcher/url_launcher.dart';

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
      child: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  
                  Column(
                    children: [
                      logInStatus == true
                          ? Container(
                              height: 180,
                              width: MediaQuery.of(context).size.width / 1,
                              color: ColorConstant.primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.only(top:30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  
                                    Container(
                                      height: 60,
                                      width: 60,
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
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                        userName,
                                          style: TextStyle(
                                              color: ColorConstant.primaryWhiteColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 5,),
                                         Text(
                                    userEmail,
                                      style: TextStyle(
                                          color: ColorConstant.primaryWhiteColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                      ],
                                    ),
                                    
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width / 1,
                              color: ColorConstant.primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.only(top:30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: ColorConstant.primaryWhiteColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.person_2_outlined, size: 45)),
                                    SizedBox(
                                      width: 10,
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
                            ),


                             
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding:  EdgeInsets.fromLTRB(15,
                          
                    logInStatus==false?0:        70,
                           
                           
                            15, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/new_icons/home_not.png",
                                  height: 18,
                                  width: 18,
                                  ),
                                  // Icon(
                                  //   Icons.home_outlined,
                                  //   size: 25,
                                  //   color: ColorConstant.primaryBlackColor,
                                  // ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    " Home",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                  
                  
                  
       logInStatus?       Column(
                    children: [
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
                                    size: 22,
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
                            
                            ],
                          ),
                        ),
                      ),
                     
                      Divider(),
                   

  InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ProfilePage();
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
                                    Icons.person_3,
                                    size: 24,
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
                              
                            ],
                          ),
                        ),
                      ),
                         Divider(),
                   

  InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return RefferAndEarnScreen();
                          }));  
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children:  [
                                   Image.asset("assets/new_icons/refer.png",
                                  height: 18,
                                  width: 18,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                     "  Refer & Earn",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                             
                            ],
                          ),
                        ),
                      ),



                    ],
                  ):Container(),
                             Divider(),
                    InkWell(
                        onTap: () {
                         openWeb('https://myfancy11.com/how_to_quiz.html');
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.help_outline_outlined,
                                    size: 23,
                                    color: ColorConstant.primaryBlackColor,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "How To Play",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                             
                            ],
                          ),
                        ),
                      ),
                   
                          Divider(),
                    InkWell(
                        onTap: () {
                        openWeb('https://myfancy11.com/code.html');
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children:  [
                                  Image.asset("assets/new_icons/comunity.png",
                                  height: 22,
                                  width: 22,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Community Guidelines",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            
                            ],
                          ),
                        ),
                      ),
                          Divider(),
                    InkWell(
                        onTap: () {
                          openWeb('https://myfancy11.com/responsible-gaming.html');
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.graphic_eq,
                                    size: 25,
                                    color: ColorConstant.primaryBlackColor,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Responsible Play",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            
                            ],
                          ),
                        ),
                      ),
                   
             
                        Divider(),
        
        
        
        
                    InkWell(
                        onTap: () {
                         openWeb('https://myfancy11.com/legality.html');
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children:  [
                                 Image.asset("assets/new_icons/legal.png",
                                  height: 22,
                                  width: 22,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    " Legality",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                   
             
                        Divider(),
                    InkWell(
                        onTap: () {
                          openWeb('https://myfancy11.com/refund.html');
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children:  [
                                Image.asset("assets/new_icons/refund.png",
                                  height: 22,
                                  width: 22,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    " Refund Policy",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                             
                            ],
                          ),
                        ),
                      ),
                   
                        Divider(),
                    InkWell(
                        onTap: () {
                        openWeb('https://myfancy11.com/points-table.html');
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children:  [
                                  Image.asset("assets/new_icons/point_table.png",
                                  height: 22,
                                  width: 22,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    " Point Table",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            
                            ],
                          ),
                        ),
                      ),
                   
             
             
                      Divider(),
                    InkWell(
                        onTap: () {
                        openWeb('https://myfancy11.com/terms.html');
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children:  [
                                  Image.asset("assets/new_icons/terms.png",
                                  height: 20,
                                  width: 20,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    " Terms & Conditions",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                             
                            ],
                          ),
                        ),
                      ),
                   
                        Divider(),
                    InkWell(
                        onTap: () {
                        openWeb('https://myfancy11.com/privacy.html');
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children:  [
                                 Image.asset("assets/new_icons/privacy.png",
                                  height: 18,
                                  width: 18,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "  Privacy Policy",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            
                            ],
                          ),
                        ),
                      ),
                   
                          Divider(),
                    InkWell(
                        onTap: () {
                       openWeb('https://myfancy11.com/about-us.html');
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children:  [
                                  Image.asset("assets/new_icons/about.png",
                                  height: 18,
                                  width: 18,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "  About Us",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
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
                                    size: 19,
                                    color: ColorConstant.primaryBlackColor,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    " Login",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
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
                            
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 10,),
                            InkWell(
                  onTap: (){
                    launchUrl(Uri.parse('https://webgradle.com/'));
                  },
                  child: Image.asset("assets/new_icons/developed_by.png",
                  height: 25,
                  color: Colors.black54,
                  )
            ),
            SizedBox(height: 39),      
                    ],
                  ),
              
      logInStatus==false?Container():          Positioned(
                  left: 10,right: 10,
                  top: 150,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                       boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                    ),

child: Column(
  children: [
    Container(
      height: 40,
      width: MediaQuery.of(context).size.width/1,
child: Padding(
  padding: const EdgeInsets.fromLTRB(15,15,15,0,),
  child:   Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,

    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/icons/wallet_icon.png",
          color: ColorConstant.primaryBlackColor,
          height: 20,
          width: 20,
          
          ),
          SizedBox(width: 5,),
          Text("My Ballance",
          style: TextStyle(
            color: ColorConstant.primaryBlackColor,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
          ),
        ],
      ),
      Text("₹${controller.getWalletApiResponse!.data.depositWallet}",
          style: TextStyle(
            color: ColorConstant.primaryBlackColor,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
          )
    ],
  ),
),
    ),
    Divider(),
     Expanded(
       child: InkWell(
        onTap: (){
  Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return WalletScreen();
                          }));
        },
         child: Container(
         // height: 45,
          width: MediaQuery.of(context).size.width/1,
            decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
           bottomLeft: Radius.circular(10),
           bottomRight: Radius.circular(10)
           
         ),
         color: ColorConstant.greenCardColor,
            
            ),
            alignment: Alignment.center,
            child: Text("ADD CASH",
            style: TextStyle(
         color: ColorConstant.primaryBlackColor,
         fontSize: 16,
         fontWeight: FontWeight.w600
            ),
            ),
           ),
       ),
     ),
  ],
),

                                  height: 100,
                                  width: MediaQuery.of(context).size.width/1,
                                  
                                 ),
                ),
              
                ],
              ),
            ),
          ),
       
       
     
       
       
        ],
      ),
    );
  }



  void openWeb(String url){
 launchUrl(Uri.parse(url),
 mode: LaunchMode.inAppWebView,
 );
  }
}
