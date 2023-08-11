import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';


class UpcommingFeatureScreen extends StatefulWidget {
  const UpcommingFeatureScreen({super.key});

  @override
  State<UpcommingFeatureScreen> createState() => _UpcommingFeatureScreenState();
}

class _UpcommingFeatureScreenState extends State<UpcommingFeatureScreen> {
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Upcomming Feature",
              style: TextStyle(
                  color: ColorConstant.primaryWhiteColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/1.3,
            child: Center(
        child:Image.asset(ImageUitls.working_image)
      ),
          ),
          Text("We are working on this feature",
          style: TextStyle(
            color: ColorConstant.primaryBlackColor,
            fontSize: 20
          ),
          )
        ],
      )
    );
  }
}