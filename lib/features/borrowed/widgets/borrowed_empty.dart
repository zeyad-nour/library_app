import 'package:flutter/material.dart';

class BorrowedEmpty extends StatelessWidget {
  const BorrowedEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            width: 90,
            height: 90,

            decoration: const BoxDecoration(
              color: Color(0xffE2E8F0),
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.menu_book_rounded,
              size: 40,
              color: Color(0xff64748B),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "No Borrowed Books",

            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xff0F172A),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Start exploring and borrow your first book",

            textAlign: TextAlign.center,

            style: TextStyle(color: Color(0xff64748B)),
          ),
        ],
      ),
    );
  }
}
