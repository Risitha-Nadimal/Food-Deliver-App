import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class DialogBox {
  Future<dynamic> dialogbox(
    BuildContext context,
    DialogType dialogType,
    String title,
    String desc,
  ) async {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: title,
      desc: desc,
      btnOkOnPress: () {},
    ).show();
  }
}
