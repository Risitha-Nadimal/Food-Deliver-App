import 'package:flutter/material.dart';
import 'package:food_deliver_app/Scrren/main_screen/resturentdetails_screen/resturent_details_screen.dart';
import 'package:food_deliver_app/component/custom_text.dart';
import 'package:food_deliver_app/component/image_title.dart';
import 'package:food_deliver_app/util/app_colors.dart';
import 'package:food_deliver_app/util/app_function.dart';

class NearestResturantSection extends StatelessWidget {
  const NearestResturantSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30),
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal, // must add axis
        physics: BouncingScrollPhysics(),
        child: Row(
          children: [
            ResturentTile(isOffer: true),
            ResturentTile(),
            ResturentTile(),
            ResturentTile(),
          ],
        ),
      ),
    );
  }
}

class ResturentTile extends StatelessWidget {
  const ResturentTile({
    super.key,
    this.isOffer = false,
  });

  final bool isOffer;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          utilFunction.navigatorto(context, const RestaruntDetailsScreen()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageTile(isOffer: isOffer),
          const SizedBox(height: 5),
          const CustomText(
            text: 'westway',
            fontSize: 16,
          ),
          const SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: primaryColor,
                      size: 15,
                    ),
                    CustomText(
                      text: '4.6',
                      fontSize: 12,
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: grayColor,
                      size: 15,
                    ),
                    SizedBox(width: 3),
                    CustomText(
                      text: '15 min',
                      fontSize: 12,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OfferTag extends StatelessWidget {
  const OfferTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: 79,
        height: 28,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: koorange,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15))),
        child: const CustomText(
            text: "50 % off",
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: kwhite),
      ),
    );
  }
}
