import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UpcommingMatchCardWidget extends StatefulWidget {
  const UpcommingMatchCardWidget({super.key});

  @override
  State<UpcommingMatchCardWidget> createState() =>
      _UpcommingMatchCardWidgetState();
}

class _UpcommingMatchCardWidgetState extends State<UpcommingMatchCardWidget> {
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                            "Uttrakhand Premier League T20",
                            style: TextStyle(
                                color: ColorConstant.primaryBlackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Icon(Icons.movie_filter_outlined,
                              size: 18,
                              color: ColorConstant.deviderColor,
                              ),
                              SizedBox(width: 10,),
                              Text(
                            "Lineup Out",
                            style: TextStyle(
                                color: ColorConstant.greenColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                            ],
                          )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
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
                            width: 80,
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
                            "07:15pm",
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
                   Padding(
              padding: const EdgeInsets.fromLTRB(0,5,10,0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tehri Titan",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Haridwar Heros",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            )
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
                width: MediaQuery.of(context).size.width/1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange[50],
                        border: Border.all(width: 1,color: Colors.orange)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Mega Rs.1.5 Lacks",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 1,color: Colors.black26)
                      ),
                      child: Image.asset(ImageUitls.Notification_icon,
                      height: 20,
                      width: 20,
                      color: Colors.black,
                      ),
                     
                     ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
