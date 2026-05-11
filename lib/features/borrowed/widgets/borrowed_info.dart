import 'package:flutter/material.dart';
import 'package:library_app/models/book_model.dart';

class BorrowedInfo extends StatelessWidget {
  final BookModel book;

  const BorrowedInfo({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          book.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,

          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff0F172A),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          book.author,

          style: const TextStyle(color: Color(0xff64748B), fontSize: 15),
        ),

        const SizedBox(height: 14),

        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),

            const SizedBox(width: 5),

            Text(
              "${book.rating}",

              style: const TextStyle(color: Color(0xff64748B)),
            ),
          ],
        ),

        const SizedBox(height: 14),

        Row(
          children: [
            const Icon(Icons.access_time, size: 18, color: Color(0xffF59E0B)),

            const SizedBox(width: 6),

            Text(
              "${book.daysLeft} days left",

              style: const TextStyle(color: Color(0xff64748B)),
            ),
          ],
        ),
      ],
    );
  }
}
