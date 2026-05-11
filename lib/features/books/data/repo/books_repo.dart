import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:library_app/core/services/api_services/api_service.dart';
import 'package:library_app/core/services/errors/failures.dart';
import 'package:library_app/features/books/data/model/api_book_model.dart';

class BooksRepo {
  final ApiService apiService;

  BooksRepo(this.apiService);

Future<Either<Failure, List<ApiBookModel>>> getBooksByCategory(
    String category) async {
  try {
    final data = await apiService.get(
      endPoint: 'volumes?q=subject:${category.toLowerCase()}',
    );

    final List items = data['items'] ?? [];

    final books = items
        .map((e) => ApiBookModel.fromJson(e))
        .toList();

    return Right(books);

  } on DioException catch (e) {

    return Left(ServerFailuer.fromDioError(e));

  } catch (e) {

    return Left(ServerFailuer(e.toString()));
  }
}
}
