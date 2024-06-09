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
    return Scaffold(
        body: Container(
      child: const CustomNetworkImage(
          url:
              'https://www.foodiesfeed.com/wp-content/uploads/2024/01/best-burger-in-town.jpg'),
    ));
  }
}
