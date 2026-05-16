// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:library_app/features/books/data/model/api_book_model.dart';

class BookGridCard extends StatelessWidget {
  final ApiBookModel book;
  const BookGridCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: book);
      },

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
       Expanded(
  child: ClipRRect(
    borderRadius: BorderRadius.circular(24),
    child: (book.image.isNotEmpty)
        ? Image.network(
            book.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey.shade300,
                child: const Icon(Icons.book, size: 50),
              );
            },
          )
        : Container(
            color: Colors.grey.shade300,
            child: const Icon(Icons.book, size: 50),
          ),
  ),
),

          const SizedBox(height: 12),

          Text(
            book.title,

            maxLines: 2,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff0F172A),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            book.author,

            maxLines: 1,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(color: Color(0xff64748B), fontSize: 13),
          ),

          const SizedBox(height: 6),

          Text(
            book.language,

            style: const TextStyle(color: Color(0xff64748B), fontSize: 13),
          ),
        ],
      ),
    );
  }
}
