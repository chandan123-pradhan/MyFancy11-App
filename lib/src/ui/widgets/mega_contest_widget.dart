import 'package:cricket_fantacy/src/models/GetContestListApiResponse.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MegaContestWidget extends StatefulWidget {
  final Contest contest;
  MegaContestWidget({required this.contest});

  @override
  State<MegaContestWidget> createState() => _MegaContestWidgetState();
}

class _MegaContestWidgetState extends State<MegaContestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      width: MediaQuery.of(context).size.width / 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: ColorConstant.deviderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.contest.offer == 'null'
              ? Container()
              : Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.red[50]),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              ImageUitls.Team_1_logo,
                              height: 30,
                              width: 50,
                            ),
                            Text(
                              widget.contest.offer,
                              style: TextStyle(
                                  color: ColorConstant.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.navigate_next_sharp,
                          size: 25,
                        )
                      ]),
                ),
          Container(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.contest.contestName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Prize Pool",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "₹${widget.contest.prizePool}",
                      style: TextStyle(
                          color: ColorConstant.primaryBlackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Entry",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorConstant.greenColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "₹${int.parse(widget.contest.entry) + int.parse(widget.contest.bonusEntry)}",
                        style: TextStyle(
                            color: ColorConstant.primaryWhiteColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: widget.contest.bonusEntry != '0'
                      ? MediaQuery.of(context).size.width / 1.8
                      : MediaQuery.of(context).size.width / 1.19,
                  child: LinearProgressIndicator(
                    minHeight: 4,
                    value:
                        //((3/50)*100)/100,
                        ((int.parse(widget.contest.joinTeam) /
                                    int.parse(widget.contest.totalTeam)) *
                                100) /
                            100, // Set the value here
                    backgroundColor: Colors.red[50],
                    valueColor: AlwaysStoppedAnimation<Color>(
                        ColorConstant.primaryColor),
                  ),
                ),
                widget.contest.bonusEntry != '0'
                    ? Text(
                        "Use Bonus ₹${widget.contest.bonusEntry}",
                        style: TextStyle(
                            color: ColorConstant.primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      )
                    : Container()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${int.parse(widget.contest.totalTeam) - int.parse(widget.contest.joinTeam)} spots left",
                  style: TextStyle(
                      color: ColorConstant.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "${int.parse(widget.contest.totalTeam)} spots",
                  style: TextStyle(
                      color: ColorConstant.disableColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.grey[200]),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/new_icons/winner_not.png',
                          height: 14,
                          width: 14,
                        ),
                        Text(
                          " ₹${widget.contest.firstPrize}",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black38),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Max winners:",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${widget.contest.winPercent} ",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ]),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 15,
                        color: Colors.black45,
                      ),
                      Text(
                        " guaranteed",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
