import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StepperWidget extends StatefulWidget {
  int step;
  StepperWidget({required this.step});
  
  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 50,
              color: ColorConstant.primaryBlackColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Match",
                          style: TextStyle(
                              color: ColorConstant.primaryWhiteColor,
                              fontSize: 12),
                        ),
                        Text(
                          "Join Contest",
                          style: TextStyle(
                              color: ColorConstant.primaryWhiteColor,
                              fontSize: 12),
                        ),
                        Text(
                          "Create Team",
                          style: TextStyle(
                              color: ColorConstant.primaryWhiteColor,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorConstant.greenColor),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.check,
                            size: 8,
                            color: ColorConstant.primaryWhiteColor,
                          ),
                        ),
                  
                  
                        Container(
                          width: MediaQuery.of(context).size.width / 2.41,
                          height: 2,
                          color:
                          
                          
                           ColorConstant.greenColor
                        ),
                     widget.step==3?  Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorConstant.greenColor),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.check,
                            size: 8,
                            color: ColorConstant.primaryWhiteColor,
                          ),
                        ):      Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1,
                                  color: ColorConstant.primaryWhiteColor)),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.41,
                            height: 2,
                            color: 
                            widget.step==3?ColorConstant.greenColor:
                            
                            Colors.grey[400]),
                     Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1,
                                  color: ColorConstant.primaryWhiteColor)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
            
  }
}