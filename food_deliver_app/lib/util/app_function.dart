import 'package:flutter/material.dart';

class utilFunction {
  static void navigatorto(BuildContext context, Widget widget) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }
}
