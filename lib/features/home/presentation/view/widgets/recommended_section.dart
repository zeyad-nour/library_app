import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/home/presentation/state_mangement/cubit/home_state.dart';
import 'package:library_app/features/home/presentation/view/widgets/book_card.dart';
import 'package:library_app/features/home/presentation/view/widgets/section_title.dart';
import '../../state_mangement/cubit/home_cubit.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HomeError) {
          return Text(state.message);
        }

        if (state is HomeLoaded) {
          final books = state.books;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                icon: Icons.auto_awesome,
                title: "Recommended",
              ),

              const SizedBox(height: 18),

              SizedBox(
                height: 270,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];

                    return BookCard(
                      title: book.title,
                      author: book.author,
                      image: book.image,
                      rating: 4.5,
                    );
                  },
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
