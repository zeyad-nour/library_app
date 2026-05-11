import 'package:flutter/material.dart';

class BorrowedHeader extends StatelessWidget {
  final int count;

  const BorrowedHeader({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.only(top: 70, left: 24, right: 24, bottom: 35),

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff2563EB), Color(0xff60A5FA)],
        ),

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            "Borrowed Books",

            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "You have $count books borrowed",

            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
