import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BottomBarItem extends StatefulWidget {
  final String imageName;
  final title;
  bool isSelected;
  BottomBarItem({required this.imageName,required this.title,required this.isSelected});

  @override
  State<BottomBarItem> createState() => _BottomBarItemState();
}

class _BottomBarItemState extends State<BottomBarItem> {


  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          widget.imageName,
          height:  widget.isSelected==true?23: 20,
          width: widget.isSelected==true?23:20,
        ),
        const SizedBox(height: 6,),
        Text(widget.title,
        style:  TextStyle(
          color: ColorConstant.primaryWhiteColor,
          fontSize: widget.isSelected==true?15:14,
          fontWeight: widget.isSelected==true?FontWeight.w500: FontWeight.w400
        ),
        )
      ],
    );
  }
}