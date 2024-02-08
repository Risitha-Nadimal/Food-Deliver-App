import 'package:flutter/material.dart';

class utilFunction {
  static void navigatorto(BuildContext context, Widget widget) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  static void goback(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Size mediaquary(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return size;
  }
}
