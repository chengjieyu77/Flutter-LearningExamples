import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppAlerts {
  AppAlerts._();
  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(fontSize: 16.sp, color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      duration: Duration(milliseconds: 400),
    ));
  }

  static displayToast(String msg) {
    return Fluttertoast.showToast(msg: msg);
  }
}
