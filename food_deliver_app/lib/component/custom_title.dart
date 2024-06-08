import 'package:flutter/material.dart';
import 'package:food_deliver_app/component/custom_text.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: CustomText(
        text: text,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    );
  }
}
