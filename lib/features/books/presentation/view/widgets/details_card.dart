// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:library_app/features/books/data/model/api_book_model.dart';


class DetailsCard extends StatelessWidget {
  final ApiBookModel book;

  const DetailsCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -70),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),

        child: Container(
          padding: const EdgeInsets.all(24),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                book.title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff0F172A),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                book.author,
                style: const TextStyle(
                  color: Color(0xff64748B),
                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 30),

              Text(
                "Publisher: ${book.publisher}",
              ),

              Text(
                "Language: ${book.language}",
              ),

              Text(
                "Year: ${book.year}",
              ),

              const SizedBox(height: 30),

              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff0F172A),
                ),
              ),

              const SizedBox(height: 14),

              Text(
                book.description,
                style: const TextStyle(
                  color: Color(0xff64748B),
                  height: 1.7,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}