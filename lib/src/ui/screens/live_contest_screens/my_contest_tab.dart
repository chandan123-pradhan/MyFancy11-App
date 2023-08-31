import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyContestTab extends StatefulWidget {
  const MyContestTab({super.key});

  @override
  State<MyContestTab> createState() => _MyContestTabState();
}

class _MyContestTabState extends State<MyContestTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              color: ColorConstant.primaryWhiteColor,
            ),
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Practice Contest",
                          style: TextStyle(
                              color: ColorConstant.primaryBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "4 Spots",
                          style: TextStyle(
                              color: ColorConstant.primaryBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width / 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/first_winner.png",
                                  height: 32,
                                  width: 32,
                                ),
// Icon(Icons.first)
                                Text(
                                  "Glory awaits!",
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1, color: Colors.black54)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "S",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
// Icon(Icons.first)
                                Text(
                                  "Single",
                                  style: TextStyle(
                                      color: ColorConstant.primaryBlackColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle_outline_sharp,
                              size: 18,
                              color: Colors.black54,
                            ),
// Icon(Icons.first)
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Glory awaits!",
                              style: TextStyle(
                                  color: ColorConstant.primaryBlackColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
          
         , Expanded(child: Container(
         decoration: BoxDecoration(
           color: Colors.amber[50],
            borderRadius:  BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            )
         ),

child: Padding(
  padding: const EdgeInsets.fromLTRB(15,0,15,0),
  child:  
   Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width/2.5,
            child: Text("PRATYUSH TABLET KUMAR",
            maxLines: 1,
            style: TextStyle(
              color: ColorConstant.primaryBlackColor,
              overflow: TextOverflow.ellipsis,
              
            ),
            ),
          ),
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black12,

            ),
            alignment: Alignment.center,
            child: Text("T1",
            style: TextStyle(
              color: Colors.black,fontSize: 12
            ),
            ),
          ),
          SizedBox(width: 10,),
          Text("106",
            style: TextStyle(
              color: Colors.black54,fontSize: 15
            ),
            )
        ],
  ),

   Text("#3",
            style: TextStyle(
              color: Colors.black,fontSize: 15
            ),
            )
     ],
   ),
),

         ))
              ],
            ),
          ),
        );
      },
    );
  }
}
