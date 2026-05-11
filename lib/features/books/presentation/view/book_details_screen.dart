import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/books/data/model/api_book_model.dart';

import '../cubit/books_cubit.dart';
import 'widgets/details_action_bar.dart';
import 'widgets/details_card.dart';
import 'widgets/details_header.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<BooksCubit>(),

      child: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          final cubit = context.read<BooksCubit>();

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
                        isFavorite: cubit.isFavorite,
                        onFavoriteTap: cubit.toggleFavorite,
                      ),

                      DetailsCard(book: book),
                    ],
                  ),
                ),

                const DetailsActionBar(),
              ],
            ),
          );
        },
      ),
    );
  }
}