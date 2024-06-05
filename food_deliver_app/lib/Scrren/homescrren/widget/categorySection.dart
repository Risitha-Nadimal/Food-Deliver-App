import 'package:flutter/material.dart';
import 'package:food_deliver_app/component/custom_text.dart';
import 'package:food_deliver_app/util/app_colors.dart';
import 'package:food_deliver_app/util/conston.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({
    super.key,
  });

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30),
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: [
            CategoryTile(),
            CategoryTile(),
            CategoryTile(),
            CategoryTile(),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatefulWidget {
  const CategoryTile({
    super.key,
  });

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
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
              padding: const EdgeInsets.all(17),
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: isSelected ? koorange : kwhite,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(Constans.iconassest("fast-food.png")),
            ),
            const SizedBox(
              width: 4,
            ),
            const CustomText(text: "All")
          ],
        ),
      ),
    );
  }
}
