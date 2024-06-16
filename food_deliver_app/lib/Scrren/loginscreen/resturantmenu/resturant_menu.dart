import 'package:flutter/material.dart';
import 'package:food_deliver_app/component/appbar_button.dart';
import 'package:food_deliver_app/component/custom_text.dart';
import 'package:food_deliver_app/util/app_colors.dart';
import 'package:food_deliver_app/util/app_function.dart';

class ResturantMenu extends StatefulWidget {
  const ResturantMenu({super.key});

  @override
  State<ResturantMenu> createState() => _ResturantMenuState();
}

class _ResturantMenuState extends State<ResturantMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBarButton(ontap: () {
            utilFunction.goback(context);
          }),
          const Column(
            children: [
              CustomText(
                  text: 'westway',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: grayColor),
              CustomText(
                  text: 'Menu',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: primaryColor),
            ],
          ),
          AppBarButton(
            ontap: () {},
            iconname: 'sliders.png',
          )
        ],
      ),
    ));
  }
}
