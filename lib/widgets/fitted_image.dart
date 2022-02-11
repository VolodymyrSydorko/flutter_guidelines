import 'package:flutter/material.dart';

class FittedImage extends StatelessWidget {
  const FittedImage({required this.image, Key? key}) : super(key: key);

  final Image image;

  @override
  Widget build(BuildContext context) {
    return FittedBox(fit: BoxFit.fill, child: image);
  }
}
