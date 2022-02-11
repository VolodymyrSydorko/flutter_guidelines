import 'package:flutter/material.dart';
import 'package:flutter_guidelines/gen/colors.gen.dart';

void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorName.crimsonRed,
      content: Text(message, textAlign: TextAlign.center),
      duration: const Duration(seconds: 2),
    ),
  );
}
