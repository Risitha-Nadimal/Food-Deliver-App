import 'package:flutter/material.dart';
import 'package:food_deliver_app/Scrren/main_screen/homescrren/widget/categorySection.dart';
import 'package:food_deliver_app/Scrren/main_screen/homescrren/widget/chose_location_section.dart';
import 'package:food_deliver_app/Scrren/main_screen/homescrren/widget/nearest_resturant_section.dart';
import 'package:food_deliver_app/component/custom_header.dart';
import 'package:food_deliver_app/component/custom_title.dart';
import 'package:food_deliver_app/component/customtextfield.dart';
import 'package:food_deliver_app/util/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainBg,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                image: "top.png",
                widget: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 80),
                  child: CustomTextField(
                      hintText: "Find Your Taste",
                      prefix: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                ),
              ),
              const ChoseLocationSection(),
              const BottomSection(),
            ],
          ),
        ));
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      // expanded give its range of area our give some area to scrollview so need particulara area
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 34),
            CategorySection(),
            SizedBox(height: 20),
            CustomTitle(text: "Nearest Resturant"),
            SizedBox(height: 11),
            NearestResturantSection(),
            SizedBox(height: 26),
            CustomTitle(text: "Populara Resturant"),
            SizedBox(height: 11),
            NearestResturantSection(),
          ],
        ),
      ),
    );
  }
}
