// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  const HomeHeader({super.key, required this.userName});

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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: const [
                  Text(
                    "Good Morning",

                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),

                  SizedBox(height: 4),

                  Text(
                    "Khalid Ahmed",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },

                child: Container(
                  width: 52,
                  height: 52,

                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),

                  child: const Center(
                    child: Text(
                      "KA",

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/search');
            },

            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),

                borderRadius: BorderRadius.circular(20),

                border: Border.all(color: Colors.white30),
              ),

              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.white),

                  SizedBox(width: 12),

                  Text(
                    "Search books, authors...",

                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
