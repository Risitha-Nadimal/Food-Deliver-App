import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver_app/Scrren/loginscreen/register_screen.dart';
import 'package:food_deliver_app/component/custom_dialog_box.dart';
import 'package:food_deliver_app/component/custom_header.dart';
import 'package:food_deliver_app/component/customtextfield.dart';
import 'package:food_deliver_app/component/custum_button.dart';
import 'package:food_deliver_app/controller/controller.dart';
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
  final _email = TextEditingController();
  final _password = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    bool inputValidation() {
      var isValid = true;
      if (_email.text.isEmpty || _password.text.isEmpty) {
        isValid = false;
      } else if (!EmailValidator.validate(_email.text)) {
        isValid = false;
      } else {
        isValid = true;
      }

      return isValid;
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: FadeInRight(
        child: Container(
          height: utilFunction.mediaquary(context).height,
          color: const Color(0xffE5E5E5),
          child: Column(
            children: [
              const CustomHeader(
                  image: "top.png", header: "Login", tagline: "Acount"),
              const SizedBox(
                height: 50,
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
                    height: 20,
                  ),
                  Text(
                    "............  or login with email  ............",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
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
                            height: 10,
                          ),
                          CustomTextField(controller: _email),
                          const SizedBox(
                            height: 10,
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
                              controller: _password,
                              obscureText: isObscure,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 212, 79, 52))),
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
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                            onTap: () async {
                              if (inputValidation()) {
                                AuthController().loginUser(
                                    context, _email.text, _password.text);
                              } else {
                                DialogBox().dialogbox(
                                  context,
                                  DialogType.error,
                                  'Please enter correct information.',
                                  'again enter.',
                                );
                              }
                            },
                            text: "Sign in",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: RichText(
                                text: TextSpan(children: [
                              const TextSpan(
                                  text: "Don't have an accoumt  ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  )),
                              TextSpan(
                                  text: "Register",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      utilFunction.navigatorto(
                                          context, const RegisterScreen());
                                    })
                            ])),
                          )
                        ]),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
