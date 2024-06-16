import 'package:flutter/material.dart';
import 'package:food_deliver_app/Scrren/loginscreen/resturantmenu/resturant_menu.dart';
import 'package:food_deliver_app/component/appbar_button.dart';
import 'package:food_deliver_app/component/custom_image.dart';
import 'package:food_deliver_app/component/custom_text.dart';
import 'package:food_deliver_app/component/custom_title.dart';
import 'package:food_deliver_app/component/product_card.dart';
import 'package:food_deliver_app/util/app_colors.dart';
import 'package:food_deliver_app/util/app_function.dart';

class RestaruntDetailsScreen extends StatefulWidget {
  const RestaruntDetailsScreen({super.key});

  @override
  State<RestaruntDetailsScreen> createState() => _RestaruntDetailsScreenState();
}

class _RestaruntDetailsScreenState extends State<RestaruntDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UpperSection(size: size),
          const ResturentDetailsection(),
          const SizedBox(height: 23),
          const ReCategorysection(),
          const SizedBox(height: 20),
          const CustomTitle(text: 'Best Product'),
          const SizedBox(height: 12),
          const ProductListSection(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 40, bottom: 10, left: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  utilFunction.navigatorto(context, const ResturantMenu());
                },
                child: const CustomText(
                  text: 'See our menu',
                  color: koorange,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class ProductListSection extends StatelessWidget {
  const ProductListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Padding(
        padding: EdgeInsets.only(right: 0),
        child: Expanded(
          child: Column(
            children: [
              ProductCard(),
              Divider(),
              ProductCard(),
              Divider(),
              ProductCard(),
              Divider(),
              ProductCard(),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class ReCategorysection extends StatelessWidget {
  const ReCategorysection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitle(text: 'Wenst Food Menu'),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.only(left: 30),
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                ResCategoryTile(categoryName: "All"),
                ResCategoryTile(categoryName: "Pizza"),
                ResCategoryTile(categoryName: "Beverages"),
                ResCategoryTile(categoryName: "Asian"),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ResCategoryTile extends StatefulWidget {
  const ResCategoryTile({super.key, required this.categoryName});

  final String categoryName;

  @override
  State<ResCategoryTile> createState() => _ResCategoryTileState();
}

class _ResCategoryTileState extends State<ResCategoryTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 35,
              decoration: BoxDecoration(
                color: isSelected ? koorange : kwhite,
                borderRadius: BorderRadius.circular(15),
              ),
              child: CustomText(
                  text: widget.categoryName,
                  color: isSelected ? kwhite : grayColor),
            ),
          ],
        ),
      ),
    );
  }
}

class ResturentDetailsection extends StatelessWidget {
  const ResturentDetailsection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Westway",
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
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
                  )
                ],
              ),
              CustomText(
                text: 'More info',
                fontSize: 14,
                color: koorange,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text:
                'Healthy eating means eating avarity of foods that give you the nutrients you need ti maintain you health,feel good and have energy',
            fontSize: 14,
            color: grayColor,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: 320,
            child: const ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45)),
              child: CustomNetworkImage(
                  fit: BoxFit.cover,
                  url:
                      'https://www.foodiesfeed.com/wp-content/uploads/2024/01/best-burger-in-town.jpg'),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarButton(
                    ontap: () {},
                  ),
                  Row(
                    children: [
                      AppBarButton(
                        iconname: 'heart.png',
                        ontap: () {},
                      ),
                      const SizedBox(width: 16),
                      AppBarButton(
                        iconname: 'upload.png',
                        ontap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
