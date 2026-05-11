import 'package:flutter/material.dart';
import 'package:library_app/models/book_model.dart';

class DetailsRatingRow extends StatelessWidget {
  final BookModel book;

  const DetailsRatingRow({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 24),

        const SizedBox(width: 6),

        Text(
          "${book.rating}",

          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff0F172A),
          ),
        ),

        const SizedBox(width: 6),

        Text(
          "(${book.reviews} reviews)",

          style: const TextStyle(color: Color(0xff64748B)),
        ),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),

          width: 1,
          height: 20,
          color: const Color(0xffE2E8F0),
        ),

        Text(
          "${book.pages} pages",

          style: const TextStyle(color: Color(0xff64748B)),
        ),
      ],
    );
  }
}
