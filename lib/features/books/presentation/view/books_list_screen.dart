import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/books/data/repo/books_repo.dart';
import '../cubit/books_cubit.dart';
import 'widgets/book_grid_card.dart';
import 'widgets/books_app_bar.dart';

class BooksListScreen extends StatelessWidget {
  final String category;

  const BooksListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BooksCubit(context.read<BooksRepo>())..getBooksByCategory(category),

      child: Scaffold(
        backgroundColor: const Color(0xffF8FAFC),

        body: SafeArea(
          child: Column(
            children: [
              const BooksAppBar(title: "Books"),

              Expanded(
                child: BlocBuilder<BooksCubit, BooksState>(
                  builder: (context, state) {
                    if (state is BooksLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is BooksError) {
                      return Center(child: Text(state.message));
                    }

                    if (state is BooksSuccess) {
                      final books = state.books;

                      return GridView.builder(
                        padding: const EdgeInsets.all(24),
                        itemCount: books.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 18,
                              mainAxisSpacing: 22,
                              childAspectRatio: .58,
                            ),
                        itemBuilder: (context, index) {
                          final book = books[index];

                          return BookGridCard(
                           book: book,
                          );
                        },
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
