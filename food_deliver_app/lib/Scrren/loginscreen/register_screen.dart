import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver_app/component/custom_dialog_box.dart';
import 'package:food_deliver_app/component/custom_header.dart';
import 'package:food_deliver_app/component/customtextfield.dart';
import 'package:food_deliver_app/component/custum_button.dart';
import 'package:food_deliver_app/controller/controller.dart';
import 'package:food_deliver_app/util/app_function.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var isObscure = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _phoneNo = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    bool inputValidation() {
      var isValid = true;
      if (_email.text.isEmpty ||
          _name.text.isEmpty ||
          _phoneNo.text.isEmpty ||
          _password.text.isEmpty) {
        isValid = false;
      } else if (!EmailValidator.validate(_email.text)) {
        isValid = false;
      } else if (_phoneNo.text.length != 10) {
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
            child: Column(children: [
              const CustomHeader(
                  image: "top.png",
                  header: "Register",
                  tagline: "Create Acount"),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(controller: _name),
                      const SizedBox(
                        height: 10,
                      ),
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
                        "Phone Number",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          type: TextInputType.number, controller: _phoneNo),
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
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 212, 79, 52))),
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
                            await AuthController().registerUser(
                                context, _email.text, _password.text);
                          } else {
                            DialogBox().dialogbox(
                              context,
                              DialogType.error,
                              'Please enter correct information.',
                              'again enter.',
                            );

                            print("error");
                          }
                        },
                        text: "Register",
                      ),
                    ],
                  ))
            ])),
      ),
    ));
  }
}
