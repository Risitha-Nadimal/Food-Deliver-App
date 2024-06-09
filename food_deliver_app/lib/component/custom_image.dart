import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.url,
  });

  final String url;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return const CircularProgressIndicator();
      },
    );
  }
}
