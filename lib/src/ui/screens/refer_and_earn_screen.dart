import 'package:cached_network_image/cached_network_image.dart';
import 'package:cricket_fantacy/src/controllers/referal_controller.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class RefferAndEarnScreen extends StatefulWidget {
  const RefferAndEarnScreen({super.key});

  @override
  State<RefferAndEarnScreen> createState() => _RefferAndEarnScreenState();
}

class _RefferAndEarnScreenState extends State<RefferAndEarnScreen> {
  // bool isUserProfetional = false;
  var controller = Get.put(RefferalController());
  // switchToOtherTypeUser(bool value) {
  //   setState(() {
  //     isUserProfetional = value;
  //   });
  // }

  @override
  void initState() {
    controller.getMyReffer();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          "Refer & Earn",
          style: TextStyle(
              color: ColorConstant.primaryWhiteColor,
              fontSize: 17,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: GetBuilder<RefferalController>(
          init: RefferalController(),
          builder: (controller) {
            return controller.refferalApiResponse == null &&
                    controller.isError == false
                ? shimerEffect(length: 4, context: context)
                : controller.isError == true
                    ? Center(
                        child: Text("Reffer & Earn not found"),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              imageUrl: controller.refferalApiResponse!.image,
                              imageBuilder: (context, imageProvider) {
                                return Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: InkWell(
                                    onTap: (){
                                      
                                    },
                                    child: Container(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width/1,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(width: 1,color: ColorConstant.deviderColor),
                                         // shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(controller
                                                  .refferalApiResponse!.image),
                                              fit: BoxFit.fill)),
                                    ),
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
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Your Referral ID:",
                                        style: TextStyle(
                                            color:
                                                ColorConstant.primaryBlackColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        controller.refferalApiResponse!.refer
                                            .refercode,
                                        style: TextStyle(
                                            color:
                                                ColorConstant.primaryBlackColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await Clipboard.setData(ClipboardData(
                                          text:
                                              '${controller.refferalApiResponse!.refer.refercode}'));
                                      Messages().showMsg(
                                          context: context,
                                          message:
                                              "${controller.refferalApiResponse!.refer.refercode} has been copied.");
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 40,
                                      child: Icon(
                                        Icons.copy,
                                        size: 20,
                                        color: ColorConstant.greenColor,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Share.share(
                                          '${controller.refferalApiResponse!.refer.refercode}');
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 40,
                                      child: Icon(
                                        Icons.share,
                                        size: 20,
                                        color: ColorConstant.greenColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Text(
                                "By Each Referral You'll be earn Refer amount and ${controller.refferalApiResponse!.setting.referPercent}% of Each contest match fee. ",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Text(
                                "User Type",
                                style: TextStyle(
                                    color: ColorConstant.primaryBlackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width / 1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // if (controller.refferalApiResponse!
                                        //         .setting.upgradeRequest ==
                                        //     1) {
                                        //   showUserInputModeBottomSheet(
                                        //       'Normal Program', 'downgrade');
                                        // }

                                        
                                      },
                                      child: Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.4,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: controller
                                                        .refferalApiResponse!
                                                        .setting
                                                        .upgradeRequest ==
                                                    0
                                                ? ColorConstant.greenColor
                                                : Colors.transparent),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Normal",
                                          style: TextStyle(
                                              color: controller
                                                          .refferalApiResponse!
                                                          .setting
                                                          .upgradeRequest ==0
                                                      
                                                
                                                  ? ColorConstant
                                                      .primaryWhiteColor: ColorConstant
                                                      .primaryBlackColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (controller.refferalApiResponse!
                                                .setting.upgradeRequest ==
                                            0) {
                                          showUserInputModeBottomSheet(
                                              'Affiliate', 'upgrade');
                                        }
                                      },
                                      child: Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.4,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: controller
                                                        .refferalApiResponse!
                                                        .setting
                                                        .upgradeRequest ==
                                                    1
                                                ? ColorConstant.greenColor
                                                : Colors.transparent),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Affiliate Program",
                                          style: TextStyle(
                                              color: controller
                                                          .refferalApiResponse!
                                                          .setting
                                                          .upgradeRequest ==
                                                      1
                                                  ? ColorConstant
                                                      .primaryWhiteColor
                                                  : ColorConstant
                                                      .primaryBlackColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Text(
                                "Your All Referrals",
                                style: TextStyle(
                                    color: ColorConstant.primaryBlackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 0,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Referral Amount",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                child: Container(
                              color: Colors.grey[100],
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                child: ListView.builder(
                                    itemCount: controller
                                        .refferalApiResponse!.data.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                controller.refferalApiResponse!
                                                    .data[index].name,
                                                style: TextStyle(
                                                    color: ColorConstant
                                                        .primaryBlackColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "₹${controller.refferalApiResponse!.data[index].amount}",
                                                style: TextStyle(
                                                    color: ColorConstant
                                                        .primaryBlackColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                            ))
                          ],
                        ),
                      );
          }),
    );
  }

  void showUserInputModeBottomSheet(String title, task) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13)
        )),
         isScrollControlled: true,
        enableDrag: true,
        context: context,
        builder: (context) {
          return AffiliateProgramForm(
            title: title,
            task: task,
          );
        });
  }
}

class AffiliateProgramForm extends StatefulWidget {
  String title;
  String task;
  AffiliateProgramForm({required this.title, required this.task});

  @override
  State<AffiliateProgramForm> createState() => _AffiliateProgramFormState();
}

class _AffiliateProgramFormState extends State<AffiliateProgramForm> {
  bool isFormSubmited = false;
  TextEditingController _textFieldController = new TextEditingController();
  var controller = Get.put(RefferalController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Container(
           height: MediaQuery.of(context).size.height / 1.8,
          child: isFormSubmited == true
              ? 
              
             Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Request Submited!",
                        style: TextStyle(
                            color: ColorConstant.primaryBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Congratulations, Your Rquest have been submited, We'll Review it and will update your Profile soon",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Lottie.asset(
                        'assets/lotties/done.json',
                        width: 150,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorConstant.primaryBlackColor),
                          alignment: Alignment.center,
                          child: Text(
                            "Okay",
                            style: TextStyle(
                                color: ColorConstant.primaryWhiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                        SizedBox(height: 10,),
                            Expanded(
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                                onTap: (){
                                                  launchUrl(Uri.parse('https://webgradle.com/'));
                                                },
                                                child: Image.asset("assets/new_icons/developed_by.png",
                                                height: 25,
                                                color: Colors.black54,
                                                )
                                          ),
                              ),
                            ),
                    ],
                  )
                
              : 
              
              
               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Provide your below input to be an ${widget.title}",
                        style: TextStyle(
                            color: ColorConstant.primaryBlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please Enter The Reason why you want to go ${widget.title}?",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _textFieldController,
                        maxLines: 10,
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            filled: true,
                            hintText: "Enter Here.."),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (_textFieldController.text.isNotEmpty) {
                            controller.requestForUpgrade(
                                reason: _textFieldController.text,
                                type: widget.task);
                            setState(() {
                              isFormSubmited = true;
                            });
                          }
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorConstant.primaryBlackColor),
                          alignment: Alignment.center,
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: ColorConstant.primaryWhiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                       SizedBox(height: 10,),
                            Expanded(
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                                onTap: (){
                                                  launchUrl(Uri.parse('https://webgradle.com/'));
                                                },
                                                child: Image.asset("assets/new_icons/developed_by.png",
                                                height: 25,
                                                color: Colors.black54,
                                                )
                                          ),
                              ),
                            ),
                    ],
                  ),
              ),
        
      ),
    );
  }
}
