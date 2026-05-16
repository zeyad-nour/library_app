import 'package:dartz/dartz.dart';
import 'package:library_app/core/services/errors/failures.dart';
import 'package:library_app/features/home/data/model/recommended_model.dart';
import 'package:library_app/features/home/data/repos/recomended_repo/recomended_repo.dart';

class RecomendedRepoImp extends RecommendedRepo{
  RecomendedRepoImp(super.apiService);

  @override
  Future<Either<Failure, List<RecommendedModel>>> getRecommendedBooks()async {
     try {
      final data = await apiService.get(
        endPoint: "volumes?q=subject:flutter",
      );

      final List items = data['items'] ?? [];

      final books = items.map((e) => RecommendedModel.fromJson(e)).toList();

      return Right(books);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }
  } 
