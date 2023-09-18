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
import 'package:upi_india/upi_india.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
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
  late TabController _tablController;
  void getWallets() {
    controller.getWalletApi(context);
  }

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
                children: [
                  _walletTab(),
                  _withDrawTab()
                ],
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
                                    "Current Balance",
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
                                  amountController.text = '1500';
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
                                      "₹1500",
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
                                  amountController.text = '2500';
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
                                      "₹2500",
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
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Your Ekyc is not Completed\nPlease Complete Your EKyc First.",
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
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return EkycFormScreen(
                                  isItForEdit: false,
                                );
                              }));
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2.6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorConstant.primaryBlackColor
                                      ),
                              alignment: Alignment.center,
                              child: Text(
                                "Start EKyc",
                                style: TextStyle(
                                    color: ColorConstant.primaryWhiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : controller.eKycStatus==2?Center(
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
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return EkycFormScreen(
                                  isItForEdit: true,
                                );
                              }));
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2.6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorConstant.primaryBlackColor
                                      ),
                              alignment: Alignment.center,
                              child: Text(
                                "Check Detatails",
                                style: TextStyle(
                                    color: ColorConstant.primaryWhiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ):Container();
        });
  }

  Future<void> _doPayment(UpiApp app) async {
    // UpiApp app = UpiApp.googlePay;

    try {
      print(app);
      _upiIndia
          .startTransaction(
        app: app,
        receiverUpiId: "lorhanspotearnpvtltd@rbl",
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
            ? Center(
                child: Text("You Don't Have UPI Apss, Please Install first!"),
              )
            : Wrap(
                children: [
                  for (int i = 0; i < apps.length; i++)
                    InkWell(
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
                ],
              );
      },
    );
  }
}
