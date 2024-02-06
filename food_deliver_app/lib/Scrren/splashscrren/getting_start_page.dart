import 'package:flutter/material.dart';
import 'package:food_deliver_app/util/conston.dart';

class GettingStart extends StatelessWidget {
  const GettingStart({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(children: [
            Image.asset(
              Constans.imageassest("bottom.png"),
              width: size.width,
              fit: BoxFit.fitWidth,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Next"),
            )
          ]),
        ],
      ),
    ));
  }
}
