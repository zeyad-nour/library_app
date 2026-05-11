import 'package:flutter/material.dart';
import 'package:library_app/models/book_model.dart';

class SearchResultCard extends StatelessWidget {
  final BookModel book;

  const SearchResultCard({super.key, required this.book});

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
            ClipRRect(
              borderRadius: BorderRadius.circular(18),

              child: Image.network(
                book.image,
                width: 85,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    book.title,

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0F172A),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    book.author,

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
                        "${book.rating}",

                        style: const TextStyle(color: Color(0xff64748B)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
