import 'dart:developer';

import 'package:cricket_fantacy/src/controllers/live_contest_controller.dart';
import 'package:cricket_fantacy/src/models/my_contest_api_response.dart';
import 'package:cricket_fantacy/src/ui/widgets/shimmer_effect_widget.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class StatsTab extends StatefulWidget {
  // StatsTab({required this.isCompleted});
  @override
  State<StatsTab> createState() => _StatsTabState();
}

class _StatsTabState extends State<StatsTab> {
  var controller = Get.put(LiveContestController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveContestController>(
        init: LiveContestController(),
        builder: (controller) {
          return controller.myContestApiResponse == null
              ? shimerEffect(length: 3, context: context)
              : Column(
                  children: [
                    // SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Player",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorConstant.primaryBlackColor),
                          ),
                          Text(
                            "Points",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorConstant.primaryBlackColor),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller
                            .liveMatchUpdateApiResponse['stats'].length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                    color: ColorConstant.primaryWhiteColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              // height: 0,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                 ),
                                              // width: 50,
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  controller.liveMatchUpdateApiResponse[
                                                                              'stats']
                                                                          [
                                                                          index]
                                                                      [
                                                                      'image']))),
                                                    ),
                                                    Positioned(
                                                      right: 0,
                                                      top: 0,
                                                      child: Image.network(
                                                        controller.liveMatchUpdateApiResponse[
                                                                'stats'][index]
                                                            ['team_image'],
                                                        height: 15,
                                                        width: 15,
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              controller
                                                      .liveMatchUpdateApiResponse[
                                                  'stats'][index]['name'],
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .primaryBlackColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        Text(
                                          controller.liveMatchUpdateApiResponse[
                                                  'stats'][index]['points']
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                              color: ColorConstant
                                                  .primaryBlackColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
        });
  }
}
