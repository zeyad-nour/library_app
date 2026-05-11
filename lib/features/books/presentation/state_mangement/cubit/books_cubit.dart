import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/books/data/model/api_book_model.dart';
import 'package:library_app/features/books/data/repo/books_repo.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.repo) : super(BooksInitial());

  final BooksRepo repo;

  List<ApiBookModel> books = [];

  Future<void> getBooksByCategory(String category) async {
    emit(BooksLoading());

    final result = await repo.getBooksByCategory(category);
    if (isClosed) return;

    result.fold(
      (failure) {
        if (isClosed) return;

        emit(BooksError(message: failure.errorMessage));
      },
      (data) {
        if (isClosed) return;

        books = data;
        emit(BooksSuccess(books));
      },
    );
  }
}
