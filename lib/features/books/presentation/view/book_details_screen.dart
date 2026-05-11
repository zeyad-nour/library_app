import 'package:flutter/material.dart';
import 'package:library_app/features/books/data/model/api_book_model.dart';

import 'widgets/details_action_bar.dart';
import 'widgets/details_card.dart';
import 'widgets/details_header.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookJson =
        ModalRoute.of(context)!.settings.arguments
            as Map<String, dynamic>;

    final book = ApiBookModel.fromJson(bookJson);

    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                DetailsHeader(
                  image: book.image,
                  isFavorite: false, // temporary
                  onFavoriteTap: () {},
                ),

                DetailsCard(book: book),
              ],
            ),
          ),

          const DetailsActionBar(),
        ],
      ),
    );
  }
}