import 'package:cricket_fantacy/src/controllers/referal_controller.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
          "Reffer & Earn",
          style: TextStyle(
              color: ColorConstant.primaryWhiteColor,
              fontSize: 17,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: GetBuilder<RefferalController>(
          init: RefferalController(),
          builder: (controller) {
            return controller.refferalApiResponse == null && controller.isError==false
                ? shimerEffect(length: 4, context: context)
                : 
                
                controller.isError==true?Center(
                  child: Text("Reffer & Earn not found"),
                ):
                
                Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0,20,20,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Your Refferal ID:",
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    controller
                                        .refferalApiResponse!.refer.refercode,
                                    style: TextStyle(
                                        color: ColorConstant.primaryBlackColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.copy,
                                size: 20,
                                color: ColorConstant.greenColor,
                              ),
                              Icon(
                                Icons.share,
                                size: 20,
                                color: ColorConstant.greenColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                         Padding(
                         padding: const EdgeInsets.fromLTRB(20,0,20,0),
                           child: Text(
                                    "By Each Refferal You'll be earn Reffer amount and ${controller.refferalApiResponse!.setting.referPercent}% of Each contest match fee. ",
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
                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
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
                           padding: const EdgeInsets.fromLTRB(20,0,20,0),
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black12),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                   if(controller.refferalApiResponse!
                                                    .setting.upgradeRequest!=0){
                                     showUserInputModeBottomSheet('Normal Program');
                                   }
                                  },
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width / 2.23,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: controller.refferalApiResponse!
                                                    .setting.upgradeRequest ==
                                                0
                                            ? ColorConstant.greenColor
                                            : Colors.transparent),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Normal",
                                      style: TextStyle(
                                          color: controller.refferalApiResponse!.setting.upgradeRequest ==
                                                  1
                                              ? ColorConstant.primaryBlackColor
                                              : ColorConstant.primaryWhiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if(controller.refferalApiResponse!
                                                    .setting.upgradeRequest!=1){
                                    showUserInputModeBottomSheet('Affiliate Program');
                                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width / 2.23,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: controller.refferalApiResponse!
                                                    .setting.upgradeRequest ==
                                                1
                                            ? ColorConstant.greenColor
                                            : Colors.transparent),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Affiliate Program",
                                      style: TextStyle(
                                          color: controller.refferalApiResponse!
                                                      .setting.upgradeRequest ==
                                                  1
                                              ? ColorConstant.primaryWhiteColor
                                              : ColorConstant.primaryBlackColor,
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
                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
                          child: Text(
                            "Your All Refferals",
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
 padding: const EdgeInsets.fromLTRB(20,0,20,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                    color: ColorConstant.primaryBlackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Refferal Amount",
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
                                 padding: const EdgeInsets.fromLTRB(20,10,20,0),
                                child: ListView.builder(
                                  
                                    itemCount: controller.refferalApiResponse!.data.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                               controller.refferalApiResponse!.data[index].name,
                                                style: TextStyle(
                                                    color: ColorConstant
                                                        .primaryBlackColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                "₹${controller.refferalApiResponse!.data[index].amount}",
                                                style: TextStyle(
                                                    color: ColorConstant
                                                        .primaryBlackColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400),
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

  void showUserInputModeBottomSheet(String title) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return AffiliateProgramForm(title: title,);
        });
  }
}

class AffiliateProgramForm extends StatefulWidget {
  String title;
   AffiliateProgramForm({required this.title});

  @override
  State<AffiliateProgramForm> createState() => _AffiliateProgramFormState();
}

class _AffiliateProgramFormState extends State<AffiliateProgramForm> {
  bool isFormSubmited = false;
  TextEditingController _textFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.8,
        child: isFormSubmited == true
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Requiest Submited!",
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
                  ],
                ),
              )
            : ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Why You want to go in ${widget.title}?",
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
                    maxLines: 5,
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
                ],
              ),
      ),
    );
  }
}
