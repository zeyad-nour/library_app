import 'package:flutter/material.dart';
import 'package:library_app/models/book_model.dart';

class BorrowedActions extends StatelessWidget {
  final BookModel book;

  const BorrowedActions({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),

      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(
            "Due: ${book.dueDate}",

            style: const TextStyle(color: Color(0xff64748B), fontSize: 14),
          ),

          GestureDetector(
            onTap: () {},

            child: const Text(
              "Renew",

              style: TextStyle(
                color: Color(0xff2563EB),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
