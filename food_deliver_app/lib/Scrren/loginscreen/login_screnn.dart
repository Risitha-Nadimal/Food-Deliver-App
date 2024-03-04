import 'package:flutter/material.dart';
import 'package:food_deliver_app/util/app_function.dart';
import 'package:food_deliver_app/util/conston.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: utilFunction.mediaquary(context).height,
      color: const Color(0xffE5E5E5),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                Constans.imageassest("top.png"),
                width: utilFunction.mediaquary(context).width,
                fit: BoxFit.fitWidth,
              ),
              const Center(
                child: Column(children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Access Acount",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  )
                ]),
              )
            ],
          )
        ],
      ),
    ));
  }
}
