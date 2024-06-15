import 'package:flutter/material.dart';
import 'package:food_deliver_app/Scrren/main_screen/homescrren/widget/nearest_resturant_section.dart';
import 'package:food_deliver_app/component/custom_image.dart';

class ImageTile extends StatelessWidget {
  const ImageTile(
      {super.key, this.isOffer = false, this.heigth = 120, this.width = 120});

  final bool isOffer;
  final double width;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 20),
        height: heigth,
        width: width,
        // can give any to border redius
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: const CustomNetworkImage(
                url:
                    'https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg',
              ),
            ),
            // use Align widget alignment to conatainer

            isOffer ? const OfferTag() : Container()
          ],
        ));
  }
}
