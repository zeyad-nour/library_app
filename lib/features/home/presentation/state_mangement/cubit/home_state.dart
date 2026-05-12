import 'package:library_app/features/home/data/model/recommended_model.dart';


abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<RecommendedModel> books;

  HomeLoaded(this.books);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}