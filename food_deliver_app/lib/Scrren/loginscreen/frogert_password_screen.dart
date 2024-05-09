import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver_app/component/custom_dialog_box.dart';
import 'package:food_deliver_app/component/custom_header.dart';
import 'package:food_deliver_app/component/customtextfield.dart';
import 'package:food_deliver_app/component/custum_button.dart';
import 'package:food_deliver_app/util/app_function.dart';
import 'package:google_fonts/google_fonts.dart';

class FrogertPasswortScrren extends StatefulWidget {
  const FrogertPasswortScrren({super.key});

  @override
  State<FrogertPasswortScrren> createState() => _FrogertPasswortScrrenState();
}

class _FrogertPasswortScrrenState extends State<FrogertPasswortScrren> {
  final _email = TextEditingController();
  bool isloding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: utilFunction.mediaquary(context).height,
            color: const Color(0xffE5E5E5),
            child: Column(children: [
              const CustomHeader(
                  image: "top.png",
                  header: "Frogert Password",
                  tagline: "Resert Your Password"),
              const SizedBox(
                height: 50,
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
                          height: 10,
                        ),
                        CustomTextField(controller: _email),
                        const SizedBox(
                          height: 20,
                        ),
                        isloding
                            ? const Center(child: CircularProgressIndicator())
                            : CustomButton(
                                onTap: () async {
                                  if (inputValidation()) {
                                    setState(() {
                                      isloding = true;
                                    });

                                    setState(() {
                                      isloding = false;
                                    });
                                  } else {
                                    DialogBox().dialogbox(
                                      context,
                                      DialogType.error,
                                      'Please enter correct information.',
                                      'again enter.',
                                    );
                                  }
                                },
                                text: "Send Password resert email",
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                      ]))
            ])));
  }

  bool inputValidation() {
    var isValid = true;
    if (_email.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }

    return isValid;
  }
}
