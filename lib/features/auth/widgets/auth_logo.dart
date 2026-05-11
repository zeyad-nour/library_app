import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),

        gradient: const LinearGradient(
          colors: [Color(0xff2563EB), Color(0xff60A5FA)],
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(.25),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: const Icon(Icons.menu_book_rounded, color: Colors.white, size: 42),
    );
  }
}
