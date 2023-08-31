import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BottomBarItem extends StatefulWidget {
  final String imageName;
  final title;
  bool isSelected;
  BottomBarItem(
      {required this.imageName, required this.title, required this.isSelected});

  @override
  State<BottomBarItem> createState() => _BottomBarItemState();
}

class _BottomBarItemState extends State<BottomBarItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 130,

      // width: 130,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color:
                  
                  
              widget.isSelected?     Colors.redAccent[100]:Colors.transparent
                   
                   ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  widget.imageName,
                  height: 20,
                  width: 20,
                  color:  Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  color:  Colors.black,
                  fontSize: 12,
                  fontWeight: widget.isSelected == true
                      ? FontWeight.w500
                      : FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
