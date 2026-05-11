import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/services/api_services/api_service.dart';

import '../cubit/books_cubit.dart';
import 'widgets/book_grid_card.dart';
import 'widgets/books_app_bar.dart';

class BooksListScreen extends StatelessWidget {
  const BooksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BooksCubit(ApiService(Dio())),

      child: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          final cubit = context.read<BooksCubit>();
          final books = cubit.books;

          return Scaffold(
            backgroundColor: const Color(0xffF8FAFC),

            body: SafeArea(
              child: Column(
                children: [
                  const BooksAppBar(title: "Books"),

                  Expanded(
                    child: Builder(
                      builder: (_) {
                        // Loading state
                        if (state is BooksLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        // Error state
                        if (state is BooksError) {
                          return const Center(
                            child: Text("Something went wrong"),
                          );
                        }

                        // Empty state
                        if (books.isEmpty) {
                          return const Center(
                            child: Text("No books found"),
                          );
                        }

                        // Grid
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
                            final volumeInfo = book['volumeInfo'];

                            return BookGridCard(
                              title: volumeInfo['title'] ?? '',
                              author: (volumeInfo['authors'] ?? ['Unknown'])[0],
                              image: volumeInfo['imageLinks']?['thumbnail'] ?? '',
                              rating: 4.0,
                            );
                          },
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