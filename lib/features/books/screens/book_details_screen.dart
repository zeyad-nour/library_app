import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/books_cubit.dart';

import '../data/book_details_data.dart';

import '../widgets/details_action_bar.dart';
import '../widgets/details_card.dart';
import '../widgets/details_header.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BooksCubit(),

      child: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          final cubit = context.read<BooksCubit>();

          return Scaffold(
            backgroundColor: const Color(0xffF8FAFC),

            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      DetailsHeader(
                        image: bookDetails.image,

                        isFavorite: cubit.isFavorite,

                        onFavoriteTap: () {
                          cubit.toggleFavorite();
                        },
                      ),

                      DetailsCard(book: bookDetails),
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
