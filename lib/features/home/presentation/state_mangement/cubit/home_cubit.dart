import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/home/data/repos/recomended_repo/recomended_repo_imp.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RecomendedRepoImp repo;

  HomeCubit(this.repo) : super(HomeInitial());

  Future<void> loadHome() async {
    emit(HomeLoading());

    final result = await repo.getRecommendedBooks();

    result.fold(
      (error) => emit(HomeError(error.toString())),
      (books) => emit(HomeLoaded(books)),
    );
  }
}