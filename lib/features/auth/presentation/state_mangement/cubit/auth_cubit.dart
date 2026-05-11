import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  bool showPassword = false;

  void togglePasswordVisibility() {
    showPassword = !showPassword;
    emit(AuthPasswordVisibilityChanged());
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    final result = await authRepo.signIn(email: email, password: password);

    if (isClosed) return;

    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(AuthSuccess()),
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    final result = await authRepo.signUp(
      name: name,
      email: email,
      password: password,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(AuthSuccess()),
    );
  }
}
