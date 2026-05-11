// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:library_app/models/book_model.dart';

import 'details_info_row.dart';
import 'details_rating_row.dart';
import 'genres_wrap.dart';

class DetailsCard extends StatelessWidget {
  final BookModel book;

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
                style: const TextStyle(color: Color(0xff64748B), fontSize: 17),
              ),

              const SizedBox(height: 24),

              DetailsRatingRow(book: book),

              const SizedBox(height: 26),

              GenresWrap(genres: book.genres),

              const SizedBox(height: 30),

              DetailsInfoRow(title: "Publisher", value: book.publisher),

              DetailsInfoRow(title: "Language", value: book.language),

              DetailsInfoRow(title: "Year", value: book.year.toString()),

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
