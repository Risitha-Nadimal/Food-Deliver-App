import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
  List list = [
    1,
    2,
    3,
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
            items: list.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    child: Column(
                      children: [
                        Image.asset(
                          Constans.imageassest("popcorn.png"),
                          scale: 3,
                        ),
                        const SizedBox(height: 37),
                        const Text(
                          "Choose a Tasty Dish",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Order anithing you want from \n Favorite resturant ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
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
                onTap: () => buttonCarouselController.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
          const bottomside(),
        ],
      ),
    ));
  }
}

class bottomside extends StatelessWidget {
  const bottomside({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
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
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.lightBlue)),
                onPressed: () {},
                child: const Text("Next", style: TextStyle(color: kwhite)),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: kblack),
                  ))
            ],
          ),
        )
      ]),
    );
  }
}
