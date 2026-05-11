import 'package:flutter/material.dart';
import 'package:library_app/features/books/data/model/api_book_model.dart';

import 'widgets/details_action_bar.dart';
import 'widgets/details_card.dart';
import 'widgets/details_header.dart';



class BookDetailsScreen extends StatelessWidget {
  final ApiBookModel book;

  const BookDetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                DetailsHeader(
                  image: book.image,
                  isFavorite: false,
                  onFavoriteTap: () {},
                ),

                DetailsCard(book: book),
              ],
            ),
          ),

          DetailsActionBar(book: book),
        ],
      ),
    );
  }
}
