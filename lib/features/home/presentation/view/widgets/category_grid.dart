// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "name": "Fiction",
        "icon": "📚",
        "colors": [Colors.purple, Colors.pink],
      },
      {
        "name": "Science",
        "icon": "🔬",
        "colors": [Colors.blue, Colors.cyan],
      },
      {
        "name": "History",
        "icon": "📜",
        "colors": [Colors.orange, Colors.red],
      },
      {
        "name": "Art",
        "icon": "🎨",
        "colors": [Colors.green, Colors.teal],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          "Categories",

          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xff0F172A),
          ),
        ),

        const SizedBox(height: 18),

        GridView.builder(
          shrinkWrap: true,

          physics: const NeverScrollableScrollPhysics(),

          itemCount: categories.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.25,
          ),

          itemBuilder: (context, index) {
            final category = categories[index];

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/books',
                  arguments: category["name"],
                );
              },

              child: Container(
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),

                  gradient: LinearGradient(
                    colors: category["colors"] as List<Color>,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      category["icon"] as String,

                      style: const TextStyle(fontSize: 38),
                    ),

                    Text(
                      category["name"] as String,

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
