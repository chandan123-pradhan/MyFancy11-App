import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WinningTab extends StatefulWidget {
  const WinningTab({super.key});

  @override
  State<WinningTab> createState() => _WinningTabState();
}

class _WinningTabState extends State<WinningTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Container(
          height: 40,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: Text("Be the first in your network to join this contest",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black54
            ),
            
            
            ),
          ),
        ),
      //  Divider(),
        Container(
           decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,color: Colors.black12
            ),
            top: BorderSide(
              width: 1,color: Colors.black12
            )
          )
        ),
        height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left:15.0,right: 15,top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rank",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54
                ),
                
                
                ),
                 Text("Winnings",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54
                ),
                
                
                ),
              ],
            ),
          ),
        ),
        

Expanded(
  child: SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column
    (
      children: [
        for(int i=0;i<500;i++)
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,color: Colors.black12
              )
            )
          ),
          height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left:15.0,right: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${i+1}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.primaryBlackColor
                  ),
                  
                  
                  ),
                   Text("₹1.50 Lakhs",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                   color: ColorConstant.primaryBlackColor
                  ),
                  
                  
                  ),
                ],
              ),
          ),
        )
      ],
    ),
  )
  
  
  )

      ],
    );
  }
}