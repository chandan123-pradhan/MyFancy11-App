import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UpcommingMatchesDetails extends StatefulWidget {
  const UpcommingMatchesDetails({super.key});

  @override
  State<UpcommingMatchesDetails> createState() => _UpcommingMatchesDetailsState();
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
onTap: (){
  Navigator.pop(context);
},
          child: Icon(Icons.navigate_before,size: 30,
          color: ColorConstant.primaryWhiteColor,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("SS vs LKK",
            style: TextStyle(
              color: ColorConstant.primaryWhiteColor,
              fontSize: 17,
              fontWeight: FontWeight.w600
            ),
            ),
             Text("06h 55m Left",
            style: TextStyle(
              color: ColorConstant.primaryWhiteColor,
              fontSize: 12,
              fontWeight: FontWeight.w400
            ),
            ),
          ],
        ),
        actions: [
        Padding(
          padding: const EdgeInsets.only(right:20.0),
          child: Image.asset(ImageUitls.Wallet_icon,
          height: 20,
          width: 20,
          ),
        )
        ],
      ),

body: Column(
  children: [
    Container(
      height: 40,
      color: ColorConstant.primaryBlackColor,
      
    )
  ],
),

    );
  }
}