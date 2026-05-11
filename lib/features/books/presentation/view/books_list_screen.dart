import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/books_cubit.dart';

import '../../data/all_books_data.dart';

import 'widgets/book_grid_card.dart';
import 'widgets/books_app_bar.dart';

class BooksListScreen extends StatelessWidget {
  const BooksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BooksCubit(),

      child: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffF8FAFC),

            body: SafeArea(
              child: Column(
                children: [
                  const BooksAppBar(title: "All Books"),

                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(24),

                      itemCount: allBooks.length,

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,

                            crossAxisSpacing: 18,

                            mainAxisSpacing: 22,

                            childAspectRatio: .58,
                          ),

                      itemBuilder: (context, index) {
                        final book = allBooks[index];

                        return BookGridCard(
                          title: book.title,
                          author: book.author,
                          image: book.image,
                          rating: book.rating,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
