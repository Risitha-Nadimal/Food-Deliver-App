import 'package:flutter/material.dart';
import 'package:food_deliver_app/util/app_function.dart';
import 'package:food_deliver_app/util/conston.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader(
      {super.key,
      required this.header,
      required this.image,
      //required this.size,
      required this.tagline});

  //final Size size;
  final String image;
  final String header;
  final String tagline;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Constans.imageassest(image),
          width: utilFunction.mediaquary(context).width,
          fit: BoxFit.fitWidth,
        ),
        Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 80,
            ),
            Text(header,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2)),
            Text(
              tagline,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            )
          ]),
        )
      ],
    );
  }
}
