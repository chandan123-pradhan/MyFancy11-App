import 'package:cricket_fantacy/src/ui/screens/home_tab/join_contest_screen.dart';
import 'package:cricket_fantacy/src/ui/widgets/mega_contest_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/multiple_contest_widget.dart';
import 'package:cricket_fantacy/src/ui/widgets/steper_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UpcommingMatchesDetails extends StatefulWidget {
  const UpcommingMatchesDetails({super.key});

  @override
  State<UpcommingMatchesDetails> createState() =>
      _UpcommingMatchesDetailsState();
}

class _UpcommingMatchesDetailsState extends State<UpcommingMatchesDetails> {
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SS vs LKK",
              style: TextStyle(
                  color: ColorConstant.primaryWhiteColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "06h 55m Left",
              style: TextStyle(
                  color: ColorConstant.primaryWhiteColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              ImageUitls.Wallet_icon,
              height: 20,
              width: 20,
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height/1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
           StepperWidget(step: 2,),
           Container(
              height: 40,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Short By: ",
                      style: TextStyle(
                          color: ColorConstant.disableColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 1.4,
                      alignment: Alignment.centerLeft,
                      child: ListView(
                        padding: EdgeInsets.only(top: 10),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "Entry",
                              style: TextStyle(
                                  color: ColorConstant.disableColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "Spots",
                              style: TextStyle(
                                  color: ColorConstant.disableColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "Price Pool",
                              style: TextStyle(
                                  color: ColorConstant.disableColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              "% Winners",
                              style: TextStyle(
                                  color: ColorConstant.disableColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.filter_alt,
                      size: 25,
                      color: Colors.black38,
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: ColorConstant.deviderColor))),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 0,right: 0,top: 10),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 14),
                        child: Text(
                                    "Mega Contest",
                                    style: TextStyle(
                          color: ColorConstant.primaryBlackColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                                  ),
                      ),
                            
                            
                  Padding(
                     padding: const EdgeInsets.only(left: 15,right: 14,top: 10),
                       
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return JoinContest();
                        }));
                      },
                      child: MegaContestWidget()),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 5,
                    color: ColorConstant.deviderColor,
                  ),
                             SizedBox(height: 10,),
                            
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 14),
                        child: Text(
                                    "Multiplier Contests",
                                    style: TextStyle(
                          color: ColorConstant.primaryBlackColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                                  ),
                      ),
                            
                            
                  Padding(
                     padding: const EdgeInsets.only(left: 15,right: 14,top: 10),
                       
                    child: MultipleContest(),
                  ),
                  
                            
                            SizedBox(height: 10,),
                            
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 14),
                        child: Text(
                                    "Only For Begginers",
                                    style: TextStyle(
                          color: ColorConstant.primaryBlackColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                                  ),
                      ),
                            
                            
                  Padding(
                     padding: const EdgeInsets.only(left: 15,right: 14,top: 10),
                       
                    child: MultipleContest(),
                  ),
                            
                  SizedBox(height: 10,),            
                            
                  
                    ],
                  ),
                ),
              ),
            ),
      
      
      
      
          ],
        ),
      ),
    );
  }
}
