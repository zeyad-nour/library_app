import 'package:dartz/dartz.dart';
import 'package:library_app/core/services/api_services/api_service.dart';
import 'package:library_app/core/services/errors/failures.dart';
import 'package:library_app/features/home/data/model/recommended_model.dart';

abstract class RecommendedRepo {
  final ApiService apiService;

  RecommendedRepo(this.apiService);

  Future<Either<Failure, List<RecommendedModel>>> getRecommendedBooks();
}
