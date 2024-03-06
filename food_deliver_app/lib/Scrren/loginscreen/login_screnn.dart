import 'package:flutter/material.dart';
import 'package:food_deliver_app/component/customtextfield.dart';
import 'package:food_deliver_app/util/app_function.dart';
import 'package:food_deliver_app/util/conston.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isObscure = true;
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
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      Text("Login",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2)),
                      Text(
                        "Access Acount",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: Image.asset(
                        Constans.imageassest("google.png"),
                        scale: 18,
                      )),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: Image.asset(
                        Constans.imageassest("fb.png"),
                        scale: 85,
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "or login with email",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const CustomTextField(),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Password",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: isObscure,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                  icon: Icon(isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                        ),
                      )
                    ]),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
