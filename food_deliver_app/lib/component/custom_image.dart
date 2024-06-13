import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {super.key, required this.url, this.width, this.heigth, this.fit});

  final String url;
  final double? width;
  final double? heigth;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: heigth,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return const CircularProgressIndicator();
      },
    );
  }
}
