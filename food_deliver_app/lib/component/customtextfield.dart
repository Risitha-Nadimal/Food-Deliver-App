import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.type,
    required this.controller,
  });
  TextInputType? type = TextInputType.none;
  final controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 212, 79, 52)))),
      ),
    );
  }
}
