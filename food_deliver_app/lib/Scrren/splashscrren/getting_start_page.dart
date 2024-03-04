import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver_app/Scrren/loginscreen/login_screnn.dart';
import 'package:food_deliver_app/util/app_colors.dart';
import 'package:food_deliver_app/util/app_function.dart';
import 'package:food_deliver_app/util/conston.dart';

class GettingStart extends StatefulWidget {
  const GettingStart({super.key});

  @override
  State<GettingStart> createState() => _GettingStartState();
}

class _GettingStartState extends State<GettingStart> {
  CarouselController buttonCarouselController = CarouselController();
  List<Widget> list = [
    const SliderItem(
        image: "popcorn.png",
        text1: "Chose a test Dish",
        text2: "Order anithig you want\n Favorte resturent."),
    const SliderItem(
        image: "Seek.png",
        text1: "Enjoye the Taste!",
        text2:
            "Healthy eattings means editing a \nvariety of foods that give you the \nnutrients you need to maintains\n your health."),
    const SliderItem(
        image: "wallet.png",
        text1: "Easy Paiyment",
        text2:
            "payment make easy through debit\n card, credit card & more \nways to pay for food "),
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CarouselSlider(
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
                // autoPlay: true,
                height: utilFunction.mediaquary(context).height / 2),
            carouselController: buttonCarouselController,
            items: list.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    child: Column(
                      children: [i],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => buttonCarouselController.nextPage(),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? const Color.fromARGB(255, 107, 2, 2)
                              : const Color.fromARGB(255, 239, 246, 22))
                          .withOpacity(_current == entry.key ? 0.9 : 0.2)),
                ),
              );
            }).toList(),
          ),
          bottomside(
            ontap: () => buttonCarouselController.nextPage(),
          ),
        ],
      ),
    ));
  }
}

class SliderItem extends StatelessWidget {
  const SliderItem(
      {super.key,
      required this.image,
      required this.text1,
      required this.text2});

  final String image;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Constans.imageassest(image),
          scale: 3,
        ),
        const SizedBox(height: 37),
        Text(
          text1,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        Text(
          text2,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class bottomside extends StatelessWidget {
  const bottomside({
    super.key,
    required this.ontap,
  });

  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        Constans.imageassest("bottom.png"),
        width: utilFunction.mediaquary(context).width,
        fit: BoxFit.fitWidth,
      ),
      Positioned(
        right: 43,
        bottom: 39,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(StadiumBorder()),
                  backgroundColor: MaterialStatePropertyAll(Colors.lightBlue)),
              onPressed: ontap,
              child: const Text("Next", style: TextStyle(color: kwhite)),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(color: kblack),
                ))
          ],
        ),
      )
    ]);
  }
}
