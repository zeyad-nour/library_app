import 'package:flutter/material.dart';

import '../data/history_books.dart';
import '../widgets/history_book_card.dart';
import '../widgets/history_header.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: Column(
        children: [
          HistoryHeader(count: historyBooks.length),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: historyBooks.length,

              itemBuilder: (context, index) {
                final book = historyBooks[index];

                return HistoryBookCard(
                  title: book.title,
                  author: book.author,
                  image: book.image,
                  rating: book.rating,
                  completedDate: book.completedDate,
                  borrowDate: book.borrowDate,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
