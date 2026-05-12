// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class TrendingBookCard extends StatelessWidget {
  final int index;
  final String title;
  final String author;
  final String image;
  final double rating;

  const TrendingBookCard({
    super.key,
    required this.index,
    required this.title,
    required this.author,
    required this.image,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 18),

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(24),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),

                  child: Image.network(
                    image,
                    width: 85,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: -2,
                  left: -2,

                  child: Container(
                    width: 26,
                    height: 26,

                    decoration: const BoxDecoration(
                      color: Color(0xff2563EB),
                      shape: BoxShape.circle,
                    ),

                    child: Center(
                      child: Text(
                        "${index + 1}",

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0F172A),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    author,

                    style: const TextStyle(
                      color: Color(0xff64748B),
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),

                      const SizedBox(width: 5),

                      Text(
                        "$rating",

                        style: const TextStyle(color: Color(0xff64748B)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Icon(Icons.menu_book_rounded, color: Color(0xff64748B)),
          ],
        ),
      ),
    );
  }
}
