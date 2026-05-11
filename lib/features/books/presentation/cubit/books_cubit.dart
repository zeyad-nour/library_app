import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/services/api_services/api_service.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.apiService) : super(BooksInitial());

  final ApiService apiService;

  List books = [];

  Future<void> getBooksByCategory(String category) async {
    emit(BooksLoading());

    try {
      final data = await apiService.get(
        endPoint:
            'volumes?q=subject:${category.toLowerCase()}',
      );

      books = data['items'] ?? [];

      emit(BooksLoaded());
    } catch (e) {
      emit(BooksError());
    }
  }
}