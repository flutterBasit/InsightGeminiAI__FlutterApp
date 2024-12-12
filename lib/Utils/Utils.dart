import 'package:flutter/material.dart';

void showCustomSnackBar({
  required BuildContext context,
  required String message,
  Duration duration = const Duration(seconds: 3),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 16),
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      dismissDirection: DismissDirection.horizontal,

      duration: duration,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      // Default animation for SnackBar
      animation: CurvedAnimation(
        parent: AnimationController(
          duration: const Duration(milliseconds: 300),
          vsync: ScaffoldMessenger.of(context),
        ),
        curve: Curves.easeInOut,
      ),
    ),
  );
}
