import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  final AnimationController controller;

  const SplashLogo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: controller,

      child: const Icon(Icons.menu_book_rounded, color: Colors.white, size: 90),
    );
  }
}
