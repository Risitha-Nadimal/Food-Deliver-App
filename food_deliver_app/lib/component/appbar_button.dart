import 'package:flutter/material.dart';
import 'package:food_deliver_app/util/app_colors.dart';
import 'package:food_deliver_app/util/conston.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton(
      {super.key, this.iconname = 'back.png', required this.ontap});

  final String iconname;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          padding: const EdgeInsets.all(16),
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
              color: kwhite,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Image.asset(Constans.iconassest(iconname))),
    );
  }
}
