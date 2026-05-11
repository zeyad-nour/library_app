// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  const GlassIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.2),

        borderRadius: BorderRadius.circular(14),
      ),

      child: IconButton(
        onPressed: onTap,

        icon: Icon(icon, color: color, size: 22),
      ),
    );
  }
}
