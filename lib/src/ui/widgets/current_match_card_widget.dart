import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CurrentMatchCardWidget extends StatefulWidget {
  const CurrentMatchCardWidget({super.key});

  @override
  State<CurrentMatchCardWidget> createState() => _CurrentMatchCardWidgetState();
}

class _CurrentMatchCardWidgetState extends State<CurrentMatchCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
              width: MediaQuery.of(context).size.width / 1,
              // height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstant.primaryWhiteColor,
                  border: Border.all(width: 1, color: Colors.black26)),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                ImageUitls.Team_1_logo,
                                height: 40,
                                width: 40,
                              ),
                              Text(
                                "RCB",
                                style: TextStyle(
                                    color: ColorConstant.primaryBlackColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12),
                                alignment: Alignment.center,
                                child: Text(
                                  "02h 00m",
                                  style: TextStyle(
                                      color: ColorConstant.primaryColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Today, 7:15pm",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "CSK",
                                style: TextStyle(
                                    color: ColorConstant.primaryBlackColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                ImageUitls.Team_2_logo,
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: ColorConstant.deviderColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "1 Team 1 Contest",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
        
        
  }
}