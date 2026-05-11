import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const AuthButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,

      child: ElevatedButton(
        onPressed: onTap,

        style: ElevatedButton.styleFrom(
          elevation: 8,

          backgroundColor: const Color(0xff2563EB),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        child: Text(
          text,

          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
