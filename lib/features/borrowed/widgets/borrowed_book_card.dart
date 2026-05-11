import 'package:flutter/material.dart';
import 'package:library_app/models/book_model.dart';

import 'borrowed_actions.dart';
import 'borrowed_info.dart';

class BorrowedBookCard extends StatelessWidget {
  final BookModel book;

  const BorrowedBookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 20),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),

              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),

                    child: Image.network(
                      book.image,
                      width: 95,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(child: BorrowedInfo(book: book)),
                ],
              ),
            ),

            BorrowedActions(book: book),
          ],
        ),
      ),
    );
  }
}
