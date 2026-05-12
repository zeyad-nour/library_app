import 'package:flutter/material.dart';

import '../../../data/trending_books.dart';
import 'section_title.dart';
import 'trending_book_card.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final books = trendingBooks;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const SectionTitle(icon: Icons.trending_up, title: "Trending Now"),

        const SizedBox(height: 18),

        Column(
          children: List.generate(books.length, (index) {
            final book = books[index];

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/details');
              },

              child: TrendingBookCard(
                index: index,
                title: book.title,
                author: book.author,
                image: book.image,
                rating: book.rating,
              ),
            );
          }),
        ),
      ],
    );
  }
}
