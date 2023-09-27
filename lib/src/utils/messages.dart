import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Messages {
  void showErrorMsg({required context, required String message}) {
    // final snackBar = SnackBar(
    //   backgroundColor: ColorConstant.primaryColor,
    //   content: Text(
    //     message,
    //     style: TextStyle(color: ColorConstant.primaryWhiteColor, fontSize: 13),
    //   ),
    // );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorConstant.primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void showMsg({required context, required String message}) {
    // final snackBar = SnackBar(
    //   backgroundColor: ColorConstant.greenColor,
    //   content: Text(
    //     message,
    //     style: TextStyle(color: ColorConstant.primaryWhiteColor, fontSize: 13),
    //   ),
    // );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorConstant.greenColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
