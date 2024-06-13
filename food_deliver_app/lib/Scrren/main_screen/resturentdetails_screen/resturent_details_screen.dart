import 'package:flutter/material.dart';
import 'package:food_deliver_app/component/custom_image.dart';

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
        body: Container(
      child: SizedBox(
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
    ));
  }
}
