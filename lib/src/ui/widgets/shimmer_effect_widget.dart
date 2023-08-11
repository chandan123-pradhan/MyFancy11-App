import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimerEffect({required int length,context}){
  return Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Column(children: [
                        for (int i = 0; i < 3; i++)
                          Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 1,
                                height: 100.0,
                                child: Shimmer.fromColors(
                                  direction: ShimmerDirection.ltr,
                                  period: Duration(milliseconds: 2000),
                                  baseColor: ColorConstant.deviderColor,
                                  
                                  highlightColor: ColorConstant.disableColor,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.circular(10),
                                       color: Colors.blue,
                                    ),
                                    height: 100,
                                    width: MediaQuery.of(context).size.width/1,
                                   
                                  )
                                ),
                              ))
                      ]));
}