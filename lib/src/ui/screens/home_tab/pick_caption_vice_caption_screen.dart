import 'package:cricket_fantacy/src/ui/screens/wallets/wallet_page.dart';
import 'package:cricket_fantacy/src/ui/widgets/steper_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';


class PickCaptionViceCaptionScreen extends StatefulWidget {
  const PickCaptionViceCaptionScreen({super.key});

  @override
  State<PickCaptionViceCaptionScreen> createState() => _PickCaptionViceCaptionScreenState();
}

class _PickCaptionViceCaptionScreenState extends State<PickCaptionViceCaptionScreen> {
  int captainIndex=-1;
  int vcIndex=-1;
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Team 1",
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
      body:  Center(
        child: Stack(
          children: [
            Column(
                children: [
                   Container(
                        height: 8,
                        color: ColorConstant.primaryBlackColor,
                      ),
                      StepperWidget(
                        step: 3,
                      ),
      
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width/1,
                        alignment: Alignment.center,
                        color: Colors.grey[200],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Choose Your Captain and Vice Captain",
                            style: TextStyle(
                              color: ColorConstant.primaryBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),
                            ),
                            SizedBox(height: 5,),
                             Text("C getx 2X Points, VC gets 1.5X Points",
                        style: TextStyle(
                          color: ColorConstant.primaryBlackColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                        ),
                        ),
                          ],
                        ),
                      ),
      
      
                       Container(
                height: 40,
                // color: Colors.grey[200],
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                      children: [
                         Text(
                        "TYPE",
                        style: TextStyle(
                            color: ColorConstant.primaryBlackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 50,),
                       Text(
                        "POINTS",
                        style: TextStyle(
                            color: ColorConstant.primaryBlackColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      ],
                     ),
                      
      Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                               Text(
                                "% C BY",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                         SizedBox(width: MediaQuery.of(context).size.width/7.5,),   
                          
                        Text(
                                "% V BY",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                        
            ],
      )
                      
                    ],
                  ),
                ),
              ),
      
      
      
      
      
              Expanded(
                child: ListView.builder(
                    itemCount: 11,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 1,
                        decoration: BoxDecoration(
                            border: Border(
                          top:
                              BorderSide(width: 1, color: ColorConstant.deviderColor),
                        )),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // width: MediaQuery.of(context).size.width/2.2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 80,
                                      child: Stack(children: [
                                        Image.asset(
                                          "assets/images/virat_kohali_pic.png",
                                          fit: BoxFit.fill,
                                        ),
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Icon(
                                              Icons.info_outline_rounded,
                                              size: 20,
                                              color: Colors.black54,
                                            ))
                                      ]),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Virat Kohali",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "113 pts",
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        // SizedBox(
                                        //   height: 5,
                                        // ),
                                       
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        captainIndex=index;
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                         color: captainIndex==index?ColorConstant.primaryColor:Colors.transparent,
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 1,color: ColorConstant.deviderColor)
                                      ),
                                      alignment: Alignment.center,
                                      child: Text("C",
                                      style: TextStyle(
                                        color: captainIndex==index?ColorConstant.primaryWhiteColor:Colors.black
                                      ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                      "1.35%",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                ],
                              ),
                              
                             Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 InkWell(
                                    onTap: (){
                                      setState(() {
                                        vcIndex=index;
                                      });
                                    },
                                    child:  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: vcIndex==index?ColorConstant.primaryColor:Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 1,color: ColorConstant.deviderColor)
                                    ),
                                    alignment: Alignment.center,
                                    child: Text("VC",
                                     style: TextStyle(
                                        color: vcIndex==index?ColorConstant.primaryWhiteColor:Colors.black
                                      ),
                                    ),
                                  ),),
                                  SizedBox(height: 5,),
                                  Text(
                                      "1.35%",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              
      
                ],
              ),
        
        
            Positioned(
                bottom: 10,
                left: 20,
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.black87,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.remove_red_eye,
                              size: 20,
                              color: ColorConstant.primaryWhiteColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "PREVIEW",
                              style: TextStyle(
                                  color: ColorConstant.primaryWhiteColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                       const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "/",
                          style: TextStyle(
                              color: Colors.white38,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                       const  SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.remove_red_eye,
                              size: 20,
                              color: ColorConstant.primaryWhiteColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "LINEUP",
                              style: TextStyle(
                                  color: ColorConstant.primaryWhiteColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),



Positioned(
                bottom: 10,
                right: 20,
                
                child: InkWell(
                  onTap: (){
                  
                  if(vcIndex!=-1 && captainIndex!=-1 ){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const WalletPage();
                    }));
                  }
                  },
                  child: Container(
                    height: 45,width:100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: vcIndex!=-1 && captainIndex!=-1  ?ColorConstant.primaryBlackColor: Colors.black12,
                      boxShadow: [
                        BoxShadow(
                          color: 
                          
                          
                          Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child:  Text(
                                "NEXT",
                                style: TextStyle(
                                    color: ColorConstant.primaryWhiteColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                    ),
                  ),
                )),

        
          ],
        ),
      ),
      
    );
  }
}