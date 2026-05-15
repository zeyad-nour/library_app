// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:library_app/features/profile/screens/profile_screen.dart';
import 'package:library_app/features/search/screens/search_screen.dart';

String getGreeting() {
  final hour = DateTime.now().hour;

  if (hour < 12) {
    return "Good Morning";
  } else if (hour < 18) {
    return "Good Afternoon";
  } else {
    return "Good Evening";
  }
}

String getInitials(String name) {
  if (name.trim().isEmpty) return "?";

  final parts = name.trim().split(' ');

  if (parts.length == 1) {
    return parts[0][0].toUpperCase();
  }

  return (parts[0][0] + parts[1][0]).toUpperCase();
}

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

                children: [
                  Text(
                    getGreeting(),

                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    userName,

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },

                child: Container(
                  width: 52,
                  height: 52,

                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),

                  child: Center(
                    child: Text(
                      getInitials(userName),

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
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
