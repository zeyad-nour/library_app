import 'package:flutter/material.dart';

import '../data/recomended_books.dart';
import 'book_card.dart';
import 'section_title.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final books = recommendedBooks;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const SectionTitle(icon: Icons.auto_awesome, title: "Recommended"),

        const SizedBox(height: 18),

        SizedBox(
          height: 270,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,

            itemCount: books.length,

            itemBuilder: (context, index) {
              final book = books[index];

              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/details');
                },

                child: BookCard(
                  title: book.title,
                  author: book.author,
                  image: book.image,
                  rating: book.rating,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
