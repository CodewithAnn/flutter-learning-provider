import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      // webBgColor: Colors.black87,
      // webPosition: 'center',
      backgroundColor: Colors.black,
      textColor: Colors.white,
      // backgroundColor: Colors.black,
      timeInSecForIosWeb: 3,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          forwardAnimationCurve: Easing.legacy,
          reverseAnimationCurve: Curves.easeOutBack,
          margin: const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
          borderRadius: const BorderRadius.all(Radius.circular(9)),
          duration: const Duration(seconds: 2),
          padding: const EdgeInsets.all(10),
          backgroundColor: Colors.red,
          flushbarPosition: FlushbarPosition.BOTTOM,
          icon: const Icon(Icons.error_outline_sharp),
        )..show(context));
  }
}
