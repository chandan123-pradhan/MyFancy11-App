import 'dart:developer';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/models/GetContestListApiResponse.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/ui/screens/dashboard_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/my_matches_tab/my_matches_tab.dart';
import 'package:cricket_fantacy/src/ui/screens/wallets/ekyc_form_screen.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:lottie/lottie.dart';
import 'package:upi_india/upi_india.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:upi_pay/upi_pay.dart';

class WalletScreen extends StatefulWidget {
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  bool _isActive = false;
  Messages messages = Messages();

  var controller = Get.put(HomeController());
  List<UpiApp> apps = [];
  final UpiIndia _upiIndia = UpiIndia();
  TextEditingController amountController = new TextEditingController();
  TextEditingController withdrawAmountController = new TextEditingController();
  late TabController _tablController;
  void getWallets() {
    controller.getWalletApi(context);
  }


  // TextEditingController promoCodeController = new TextEditingController();
  @override
  void initState() {
    _tablController = TabController(length: 2, vsync: this);
    // _getUpiApp();
    getWallets();

    // TODO: implement initState
    super.initState();
  }

  void _getUpiApp() async {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
      showUpiApps();

      //getWallets();
    }).catchError((e) {
      print(e);
      apps = [];
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
        body: Column(
          children: [
            TabBar(
              controller: _tablController,
              indicatorColor: ColorConstant.primaryColor,
              indicatorWeight: 5,
              labelColor: ColorConstant.primaryBlackColor,
              tabs: const [
                Tab(
                  text: 'Wallet',
                ),
                Tab(text: "Withdraw"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tablController,
                children: [_walletTab(), _withDrawTab()],
              ),
            )
          ],
        ));
  }

  _walletTab() {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return controller.getWalletApiResponse == null
              ? shimerEffect(length: 5, context: context)
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    "Deposit Amount",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )
                                ]),
                                Text(
                                  // "0",
                                  "₹${controller.getWalletApiResponse!.data.depositWallet}",
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                              SizedBox(
                              height: 5,
                            ),
                            Divider(),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    "Winning Amount",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )
                                ]),
                                Text(
                                  // "0",
                                  "₹${controller.getWalletApiResponse!.data.winningWallet}",
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            
                          SizedBox(
                              height: 5,
                            ),
                            Divider(),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    "Bonus Amount",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )
                                ]),
                                Text(
                                  // "0",
                                  "₹${controller.getWalletApiResponse!.data.bonusWallet}",
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
                                "Add Money",
                                style: TextStyle(
                                    color: ColorConstant.primaryBlackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: amountController,
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
                              InkWell(
                                onTap: () {
                                  amountController.text = '100';
                                  setState(() {});
                                },
                                child: Container(
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
                              ),
                              InkWell(
                                onTap: () {
                                  amountController.text = '200';
                                  setState(() {});
                                },
                                child: Container(
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
                                      "₹200",
                                      style: TextStyle(
                                          color:
                                              ColorConstant.primaryBlackColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  amountController.text = '500';
                                  setState(() {});
                                },
                                child: Container(
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
                              ),
                              InkWell(
                                onTap: () {
                                  amountController.text = '1000';
                                  setState(() {});
                                },
                                child: Container(
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
                                      "₹1000",
                                      style: TextStyle(
                                          color:
                                              ColorConstant.primaryBlackColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
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
                          _getUpiApp();
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
                    controller.getPromoCodeApiResponse == null
                        ? Container()
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0;
                                    i <
                                        controller.getPromoCodeApiResponse!.data
                                            .length;
                                    i++)
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: i == 0 ? 15 : 10,
                                        right: i == 4 ? 10 : 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: controller.appliedPromoCode ==
                                                  controller
                                                      .getPromoCodeApiResponse!
                                                      .data[i]
                                                      .code
                                              ? ColorConstant.disableColor
                                              : ColorConstant.primaryColor,
                                          border: Border.all(
                                              width: 1,
                                              color:
                                                  ColorConstant.deviderColor)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            Lottie.asset(
                                                'assets/lotties/promo_code.json',
                                                width: 25,
                                                height: 25),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    controller
                                                        .getPromoCodeApiResponse!
                                                        .data[i]
                                                        .code,
                                                    style: TextStyle(
                                                        color: ColorConstant
                                                            .primaryWhiteColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    controller
                                                        .getPromoCodeApiResponse!
                                                        .data[i]
                                                        .name,
                                                    style: TextStyle(
                                                        color: ColorConstant
                                                            .primaryWhiteColor,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  if (controller
                                                          .appliedPromoCode !=
                                                      controller
                                                          .getPromoCodeApiResponse!
                                                          .data[i]
                                                          .code) {
                                                    controller.applyPromoCode(
                                                        controller
                                                            .getPromoCodeApiResponse!
                                                            .data[i]
                                                            .code,
                                                        context);
                                                  }else{
                                                    controller.removeAppliedCode();
                                                  }
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        color: controller
                                                                    .appliedPromoCode ==
                                                                controller
                                                                    .getPromoCodeApiResponse!
                                                                    .data[i]
                                                                    .code
                                                            ? Colors.grey
                                                            : Colors.green),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(5, 2, 5, 2),
                                                      child: Text(
                                                        controller.appliedPromoCode ==
                                                                controller
                                                                    .getPromoCodeApiResponse!
                                                                    .data[i]
                                                                    .code
                                                            ? 'Applied'
                                                            : "Apply",
                                                        style: TextStyle(
                                                            color: controller
                                                                        .appliedPromoCode ==
                                                                    controller
                                                                        .getPromoCodeApiResponse!
                                                                        .data[i]
                                                                        .code
                                                                ? Colors.white
                                                                : ColorConstant
                                                                    .primaryWhiteColor,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          )
                  ],
                );
        });
  }

  _withDrawTab() {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return controller.eKycStatus == 0
              ? shimerEffect(length: 5, context: context)
              : controller.eKycStatus == 1
                  ? Column(
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
                                SizedBox(height: 5,),
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
                                        "Withdrawable Amount",
                                        style: TextStyle(
                                            color:
                                                ColorConstant.primaryBlackColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ]),
                                    Text(
                                      // "0",
                                      "₹${controller.getWalletApiResponse!.data.depositWallet}",
                                      style: TextStyle(
                                          color:
                                              ColorConstant.primaryBlackColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                // Divider(),
                                // SizedBox(
                                //   height: 5,
                                // ),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Row(children: [
                                //       Image.asset(
                                //         ImageUitls.Wallet_icon,
                                //         height: 20,
                                //         width: 20,
                                //         color: ColorConstant.primaryBlackColor,
                                //       ),
                                //       SizedBox(
                                //         width: 10,
                                //       ),
                                //       Text(
                                //         "Bonus Amount",
                                //         style: TextStyle(
                                //             color:
                                //                 ColorConstant.primaryBlackColor,
                                //             fontSize: 14,
                                //             fontWeight: FontWeight.w400),
                                //       )
                                //     ]),
                                //     Text(
                                //       // "0",
                                //       "₹${controller.getWalletApiResponse!.data.bonusWallet}",
                                //       style: TextStyle(
                                //           color:
                                //               ColorConstant.primaryBlackColor,
                                //           fontSize: 14,
                                //           fontWeight: FontWeight.w400),
                                //     )
                                //   ],
                                // ),
                           
                           
                              ],
                            ),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Your E-KYC is not Completed\nPlease Complete Your E-KYC First.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return EkycFormScreen(
                                          isItForEdit: false,
                                        );
                                      }));
                                    },
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width /
                                          2.6,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color:
                                              ColorConstant.primaryBlackColor),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Start E-KYC",
                                        style: TextStyle(
                                            color:
                                                ColorConstant.primaryWhiteColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : controller.eKycStatus == 2
                      ? Column(
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
                                            color:
                                                ColorConstant.primaryBlackColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Current Amount",
                                            style: TextStyle(
                                                color: ColorConstant
                                                    .primaryBlackColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ]),
                                        Text(
                                          // "0",
                                          "₹${controller.getWalletApiResponse!.data.depositWallet}",
                                          style: TextStyle(
                                              color: ColorConstant
                                                  .primaryBlackColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          Image.asset(
                                            ImageUitls.Wallet_icon,
                                            height: 20,
                                            width: 20,
                                            color:
                                                ColorConstant.primaryBlackColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Bonus Amount",
                                            style: TextStyle(
                                                color: ColorConstant
                                                    .primaryBlackColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ]),
                                        Text(
                                          // "0",
                                          "₹${controller.getWalletApiResponse!.data.bonusWallet}",
                                          style: TextStyle(
                                              color: ColorConstant
                                                  .primaryBlackColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Your Ekyc is Under Review",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // InkWell(
                                  //   onTap: () {
                                  //     Navigator.push(context,
                                  //         MaterialPageRoute(builder: (context) {
                                  //       return EkycFormScreen(
                                  //         isItForEdit: false,
                                  //       );
                                  //     }));
                                  //   },
                                  //   child: Container(
                                  //     height: 40,
                                  //     width:
                                  //         MediaQuery.of(context).size.width / 2.6,
                                  //     decoration: BoxDecoration(
                                  //         borderRadius: BorderRadius.circular(5),
                                  //         color: ColorConstant.primaryBlackColor),
                                  //     alignment: Alignment.center,
                                  //     child: Text(
                                  //       "Check Detatails",
                                  //       style: TextStyle(
                                  //           color: ColorConstant.primaryWhiteColor,
                                  //           fontSize: 16,
                                  //           fontWeight: FontWeight.w600),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : controller.eKycStatus == 3
                          ? Column(
                              children: [
                                Container(
                                  //height: 45,
                                  width: MediaQuery.of(context).size.width / 1,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        top: 15,
                                        bottom: 5),
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
                                                color: ColorConstant
                                                    .primaryBlackColor,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Withdrawable Amount",
                                                style: TextStyle(
                                                    color: ColorConstant
                                                        .primaryBlackColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ]),
                                            Text(
                                              // "0",
                                              "₹${controller.getWalletApiResponse!.data.winningWallet}",
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .primaryBlackColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                       
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    child: Text(
                                      'Choose Where You want to receive Money',
                                      style: TextStyle(
                                          color:
                                              ColorConstant.primaryBlackColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      controller.selectedPaymentGateway='0';
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/icons/upi.png',
                                              height: 30,
                                              // width: 60,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              controller
                                                  .checkEkyApiResponse!.data.upi,
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .primaryBlackColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        Icon(
                                             controller.selectedPaymentGateway == '0'
                                                ? Icons.stop_circle_outlined
                                                : Icons.circle_outlined,
                                            size: 25)
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      controller.selectedPaymentGateway='1';
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/icons/bank_account.png',
                                              height: 30,
                                              // width: 60,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                        
                                        
                                        
                                              controller.checkEkyApiResponse!.data
                                                  .accountNumber,
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .primaryBlackColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                          Icon(
                                            controller.selectedPaymentGateway == '1'
                                                ? Icons.stop_circle_outlined
                                                : Icons.circle_outlined,
                                            size: 25)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Add Withdrawal Amount",
                                        style: TextStyle(
                                            color:
                                                ColorConstant.primaryBlackColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: withdrawAmountController,
                                        keyboardType: TextInputType.number,
                                        onChanged: (val) {},
                                        decoration: InputDecoration(
                                            filled: true,
                                            hintText: "Amount to withdraw"),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),

                                      Text("Note:- 31% Income Tax Applicable",
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 12
                                      ),
                                      ),
                                       SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (withdrawAmountController
                                              .text.isNotEmpty) {
                                            controller.requestForWithdrawal(
                                                withdrawAmountController.text,
                                                context,
                                                
                                                controller.selectedPaymentGateway.toString()
                                                );
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: ColorConstant
                                                  .primaryBlackColor),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Withdraw",
                                            style: TextStyle(
                                                color: ColorConstant
                                                    .primaryWhiteColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Container();
        });
  }

  Future<void> _doPayment(UpiApp app) async {
    // UpiApp app = UpiApp.googlePay;

    try {
      print(app);
      _upiIndia
          .startTransaction(
        app: app,
        receiverUpiId: controller.splashDataApiResponse.data.upi,
        receiverName: 'MYFANCY11 INDIA PRIVATE LIMITED',
        transactionRefId: DateTime.now().toString(),
        transactionNote: 'Buying a team.',
        amount: double.parse(amountController.text),
        
      )
          .then((value) {
        debugger();
        print(value);
        if (value.status == 'success') {
          _paymentSuccess(value, app.name.toLowerCase());
        } else {
          _paymentFailed(value);
        }
      });
    } catch (e) {
      debugger();
      print(e);
    }
  }

  void _paymentSuccess(UpiResponse upiResponse, mode) {
    controller.recharge(
        context: context,
        upiResponse: upiResponse,
        amount: amountController.text,
        mode: mode);
  }

  void _paymentFailed(UpiResponse upiResponse) {
    messages.showMsg(
        context: context,
        message: 'Payment Couldnot compete, Please Try Again');
  }

  void showUpiApps() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return apps.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                 
                  Center(
                    child:
                        Text("You Don't Have UPI Apss, Please Install first!"),
                  ),
                ],
              )
            : Column(
                children: [
                  
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: [
                      for (int i = 0; i < apps.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              _doPayment(apps[i]);
                            },
                            child: ListTile(
                              leading: Image.memory(
                                apps[i].icon,
                                height: 60,
                                width: 60,
                              ),
                              title: Text(apps![i].name),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              );
      },
    );
  }

  void openWeb(String url) {
    launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
    );
  }
}
