import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool showPassword = false;

  void togglePasswordVisibility() {
    showPassword = !showPassword;

    emit(AuthPasswordVisibilityChanged());
  }

  void login({required String email, required String password}) {
    emit(AuthLoading());

    Future.delayed(const Duration(seconds: 1), () {
      emit(AuthSuccess());
    });
  }

  void register({
    required String name,
    required String email,
    required String password,
  }) {
    emit(AuthLoading());

    Future.delayed(const Duration(seconds: 1), () {
      emit(AuthSuccess());
    });
  }
}
