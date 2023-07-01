import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("body"),),
      bottomSheet: SafeArea(
        child: BottomAppBar(
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width/1,
            decoration: const BoxDecoration(
              color: ColorConstant.primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}