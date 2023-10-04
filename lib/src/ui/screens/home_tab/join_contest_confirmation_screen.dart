import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/models/GetContestListApiResponse.dart';
import 'package:cricket_fantacy/src/models/GetMatchesApiResponse.dart';
import 'package:cricket_fantacy/src/ui/screens/dashboard_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/my_matches_tab/my_matches_tab.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class JoinCotestConfirmationScreen extends StatefulWidget {
  final String myTeamId;
  final Matches match;
  final Contest contest;
  JoinCotestConfirmationScreen({required this.myTeamId, required this.match,required this.contest});

  @override
  State<JoinCotestConfirmationScreen> createState() => _JoinCotestConfirmationScreenState();
}

class _JoinCotestConfirmationScreenState extends State<JoinCotestConfirmationScreen> {
  bool _isActive=false;

var controller =Get.put(HomeController());


  void getWallets(){
    controller.getWalletApi(context);
  }


@override
  void initState() {
    getWallets();
    // TODO: implement initState
    super.initState();
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
          "Join Contest",
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
          return 
          controller.getWalletApiResponse==null?const Center(
            child: CircularProgressIndicator(color: ColorConstant.primaryColor,),
          ):
          Column(
            children: [
              Container(
                //height: 45,
                width: MediaQuery.of(context).size.width / 1,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15,top: 10,bottom: 10),
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
                            "₹${controller.getWalletApiResponse!.data.depositWallet}",
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                  SizedBox(height: 20,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            
                            Text(
                              "Entry Fee",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
                          ]),
                          Text(
                            "₹${int.parse(widget.contest.entry)+int.parse(widget.contest.bonusEntry)}",
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    SizedBox(height: 20,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            
                            Text(
                              "Usable Bonus",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
                          ]),
                          Text(
                            "₹${controller.getWalletApiResponse!.data.bonusWallet}",
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                       Text(
                              "Amount from deposit account shall be debited to ${widget.contest.entry} and Amount of ${int.parse(widget.contest.bonusEntry)} hall be bonus account",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
                  
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
      
      int.parse(widget.contest.entry)>double.parse(controller.getWalletApiResponse!.data.depositWallet)?
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15,top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                                  "Low Balance, Please Add",
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 10,),
                        TextFormField(
                          onChanged: (val) {
                             if(val.isNotEmpty){
                              setState(() {
                                _isActive=true;
                              });
                            }else{
                              setState(() {
                                _isActive=false;
                              });
                            }
                          },
                          decoration:
                              InputDecoration(filled: true, hintText: "Amount to add"),
                        ),
                      ],
                    ),
                  ),
               
                Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              width: 1, color: ColorConstant.deviderColor)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "₹500",
                          style: TextStyle(
                              color: ColorConstant.primaryBlackColor,
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
                              width: 1, color: ColorConstant.deviderColor)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "₹100",
                          style: TextStyle(
                              color: ColorConstant.primaryBlackColor,
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
                              width: 1, color: ColorConstant.deviderColor)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "₹1500",
                          style: TextStyle(
                              color: ColorConstant.primaryBlackColor,
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
                              width: 1, color: ColorConstant.deviderColor)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "₹2500",
                          style: TextStyle(
                              color: ColorConstant.primaryBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              ),
             
                ],
              ):Container(),
             
             
               Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                child: InkWell(
                  onTap: () {
controller.joinContest(context: context, contest: widget.contest);
          
          
          
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
                        color:int.parse(widget.contest.entry)<double.parse(controller.getWalletApiResponse!.data.depositWallet)?
                             ColorConstant.primaryBlackColor
                            : Colors.grey[400]),
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
        }
      ),
    );
  }
}
