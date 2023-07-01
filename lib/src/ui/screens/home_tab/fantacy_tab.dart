import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FantacyTab extends StatefulWidget {
  const FantacyTab({super.key});

  @override
  State<FantacyTab> createState() => _FantacyTabState();
}

class _FantacyTabState extends State<FantacyTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:  [
          Container(
            width: MediaQuery.of(context).size.width/1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15,10,15,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text("My Matches",
                  style: TextStyle(
                    color: ColorConstant.primaryBlackColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("View All",
                  style: TextStyle(
                    color: ColorConstant.disableColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                  Icon(Icons.navigate_next_rounded,
                  color: ColorConstant.disableColor,
                  size: 25,)
                                  ],
                                )
                ],
              ),
            ),
          ),

Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: ColorConstant.primaryWhiteColor,
  ),
)

        ],
      ),
    );
  }
}