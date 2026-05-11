import 'package:library_app/core/services/api_services/api_service.dart';
import 'package:library_app/features/books/data/model/api_book_model.dart';

class BooksRepo {
  final ApiService apiService;

  BooksRepo(this.apiService);

  Future<List<ApiBookModel>> getBooksByCategory(String category) async {
    final data = await apiService.get(
      endPoint: 'volumes?q=subject:${category.toLowerCase()}',
    );

    final List items = data['items'] ?? [];

    return items
        .map((e) => ApiBookModel.fromJson(e))
        .toList();
  }
}