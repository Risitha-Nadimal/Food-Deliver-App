import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver_app/Scrren/splashscrren/getting_start_page.dart';

class SplashScrren extends StatefulWidget {
  const SplashScrren({super.key});

  @override
  State<SplashScrren> createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GettingStart(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Roulette(
              child: Image.asset("assests/images/food-safety.png", scale: 4)),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "No wating for Food",
            style: TextStyle(fontSize: 14, color: Color(0xff838383)),
          )
        ],
      ),
    ));
  }
}
