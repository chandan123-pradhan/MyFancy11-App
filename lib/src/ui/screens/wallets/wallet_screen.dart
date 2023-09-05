import 'dart:developer';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/models/GetContestListApiResponse.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/ui/screens/dashboard_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/my_matches_tab/my_matches_tab.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:upi_india/upi_india.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
// import 'package:upi_pay/upi_pay.dart';

class WalletScreen extends StatefulWidget {
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool _isActive = false;

  var controller = Get.put(HomeController());
List<UpiApp>? apps;
final UpiIndia _upiIndia = UpiIndia();
  void getWallets() {
    controller.getWalletApi(context);
  }

  @override
  void initState() {
    //_getUpiApp();
    getWallets();

    // TODO: implement initState
    super.initState();
  }

  void _getUpiApp() async {

    CashfreePGSDK.getUPIApps().then((value)  {
      debugger();
      print(value);
        // Value is a List of MAP<String, String>
        // It consists of 3 keys "displayName", "id" and a base64 string "icon"
        // You can convert the base64 string to image and display the app icon
        });

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
          "My Wallet",
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
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return controller.getWalletApiResponse == null
                ? const Center(
                    child: CircularProgressIndicator(
                      color: ColorConstant.primaryColor,
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        //height: 45,
                        width: MediaQuery.of(context).size.width / 1,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Image.asset(
                                      ImageUitls.Wallet_icon,
                                      height: 20,
                                      width: 20,
                                      color: ColorConstant.primaryBlackColor,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Current Balance",
                                      style: TextStyle(
                                          color:
                                              ColorConstant.primaryBlackColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ]),
                                  Text(
                                    "₹${controller.getWalletApiResponse!.data.depositWallet}",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1,
                        height: 10,
                        color: ColorConstant.deviderColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add Balance",
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  onChanged: (val) {
                                    if (val.isNotEmpty) {
                                      setState(() {
                                        _isActive = true;
                                      });
                                    } else {
                                      setState(() {
                                        _isActive = false;
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                      filled: true, hintText: "Amount to add"),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          width: 1,
                                          color: ColorConstant.deviderColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Text(
                                      "₹500",
                                      style: TextStyle(
                                          color:
                                              ColorConstant.primaryBlackColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          width: 1,
                                          color: ColorConstant.deviderColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Text(
                                      "₹100",
                                      style: TextStyle(
                                          color:
                                              ColorConstant.primaryBlackColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          width: 1,
                                          color: ColorConstant.deviderColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Text(
                                      "₹1500",
                                      style: TextStyle(
                                          color:
                                              ColorConstant.primaryBlackColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          width: 1,
                                          color: ColorConstant.deviderColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Text(
                                      "₹2500",
                                      style: TextStyle(
                                          color:
                                              ColorConstant.primaryBlackColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                        child: InkWell(
                          onTap: () {
                           // initiateTransaction();
                           // _pay();
                            //           if (_isActive == true) {
                            //             final snackBar = SnackBar(
                            //       content: const Text('Fund Added Successfully Done.'),
                            //       action: SnackBarAction(
                            //         label: 'Ok',
                            //         onPressed: () {
                            //           // Some code to undo the change.
                            //         },
                            //       ),
                            //     );

                            //     // Find the ScaffoldMessenger in the widget tree
                            //     // and use it to show a SnackBar.
                            //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                            //       return DashboardScreen(index: 1);
                            //     }), (route) => false);
                            // // Navigator.push(context, MaterialPageRoute(builder: (context){
                            // //   return const MyMatchesTab();
                            // // }));
                            //           }
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ColorConstant.primaryBlackColor),
                            alignment: Alignment.center,
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: ColorConstant.primaryWhiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
          }),
    );
  }


   Future<UpiResponse> initiateTransaction(UpiApp app) async {
    // UpiApp app = UpiApp.googlePay;
    print(app);
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "9078600498@ybl",
      receiverName: 'Md Azharuddin',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: 1.00,
    );
  }
}
