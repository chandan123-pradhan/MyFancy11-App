import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';

class Messages {
  void showErrorMsg({required context, required String message}) {
    final snackBar = SnackBar(
      backgroundColor: ColorConstant.primaryColor,
      content: Text(
        message,
        style: TextStyle(color: ColorConstant.primaryWhiteColor, fontSize: 13),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showMsg({required context, required String message}) {
    final snackBar = SnackBar(
      backgroundColor: ColorConstant.greenColor,
      content: Text(
        message,
        style: TextStyle(color: ColorConstant.primaryWhiteColor, fontSize: 13),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
