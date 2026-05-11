import 'package:flutter/material.dart';

class BooksAppBar extends StatelessWidget {
  final String title;

  const BooksAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),

      color: Colors.white,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Container(
            width: 45,
            height: 45,

            decoration: BoxDecoration(
              color: const Color(0xffF8FAFC),

              borderRadius: BorderRadius.circular(14),
            ),

            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },

              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Color(0xff0F172A),
              ),
            ),
          ),

          Text(
            title,

            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xff0F172A),
            ),
          ),

          Container(
            width: 45,
            height: 45,

            decoration: BoxDecoration(
              color: const Color(0xffF8FAFC),

              borderRadius: BorderRadius.circular(14),
            ),

            child: IconButton(
              onPressed: () {},

              icon: const Icon(Icons.tune, color: Color(0xff0F172A)),
            ),
          ),
        ],
      ),
    );
  }
}
