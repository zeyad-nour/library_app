import 'package:flutter_bloc/flutter_bloc.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());

  bool isFavorite = false;

  void toggleFavorite() {
    isFavorite = !isFavorite;

    emit(BookFavoriteChanged());
  }
}
