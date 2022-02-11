import 'package:flutter/material.dart';
import 'package:flutter_guidelines/gen/colors.gen.dart';

void showInfoSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorName.gray410,
      content: Text(message, textAlign: TextAlign.center),
      duration: const Duration(seconds: 2),
    ),
  );
}
