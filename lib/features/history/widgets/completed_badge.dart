import 'package:flutter/material.dart';

class CompletedBadge extends StatelessWidget {
  const CompletedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,

      decoration: const BoxDecoration(
        color: Color(0xff10B981),
        shape: BoxShape.circle,
      ),

      child: const Icon(Icons.check_circle, color: Colors.white, size: 20),
    );
  }
}
