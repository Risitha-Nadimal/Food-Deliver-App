import 'package:flutter/material.dart';
import 'package:food_deliver_app/Scrren/homescrren/widget/categorySection.dart';
import 'package:food_deliver_app/Scrren/homescrren/widget/chose_location_section.dart';
import 'package:food_deliver_app/component/custom_header.dart';
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
              const SizedBox(
                height: 34,
              ),
              const CategorySection()
            ],
          ),
        ));
  }
}
