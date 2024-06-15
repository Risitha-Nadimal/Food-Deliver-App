import 'package:flutter/material.dart';
import 'package:food_deliver_app/component/custom_text.dart';
import 'package:food_deliver_app/component/image_title.dart';
import 'package:food_deliver_app/util/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kwhite,
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 10), blurRadius: 20, color: Colors.black12)
          ]),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageTile(isOffer: true, heigth: 90, width: 90),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Vegitable Salad",
                    fontSize: 14,
                  ),
                  CustomText(
                    text: "in Pizza Mania",
                    color: grayColor,
                    fontSize: 12,
                  ),
                  CustomText(
                    text: "Price 152.00",
                    fontSize: 14,
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.add,
            color: grayColor,
          )
        ],
      ),
    );
  }
}
