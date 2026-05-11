import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final VoidCallback onTap;

  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: double.infinity,
        height: 58,

        decoration: BoxDecoration(
          color: const Color(0xff2563EB),
          borderRadius: BorderRadius.circular(18),
        ),

        child: Center(
          child: Text(
            text,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
