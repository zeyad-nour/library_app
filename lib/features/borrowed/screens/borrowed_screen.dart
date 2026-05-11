import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/borrowed_cubit.dart';
import '../cubit/borrowed_state.dart';

import '../widgets/borrowed_book_card.dart';
import '../widgets/borrowed_empty.dart';
import '../widgets/borrowed_header.dart';

class BorrowedScreen extends StatelessWidget {
  const BorrowedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BorrowedCubit(),

      child: BlocBuilder<BorrowedCubit, BorrowedState>(
        builder: (context, state) {
          final cubit = context.read<BorrowedCubit>();

          return Scaffold(
            backgroundColor: const Color(0xffF8FAFC),

            body: Column(
              children: [
                BorrowedHeader(count: cubit.books.length),

                Expanded(
                  child: cubit.books.isEmpty
                      ? const BorrowedEmpty()
                      : ListView.builder(
                          padding: const EdgeInsets.all(24),

                          itemCount: cubit.books.length,

                          itemBuilder: (context, index) {
                            return BorrowedBookCard(book: cubit.books[index]);
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
