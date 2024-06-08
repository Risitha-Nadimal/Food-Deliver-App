import 'package:flutter/material.dart';
import 'package:food_deliver_app/component/custom_text.dart';
import 'package:food_deliver_app/util/conston.dart';

class ChoseLocationSection extends StatelessWidget {
  const ChoseLocationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 42,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(Constans.iconassest("location.png"), scale: 15),
              const SizedBox(width: 13),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "Home"),
                  CustomText(
                    text: "10 post,Gallella,Ratnapura",
                    fontSize: 14,
                  )
                ],
              ),
            ],
          ),
          Image.asset(Constans.iconassest("sliders.png"), scale: 15),
        ],
      ),
    );
  }
}
