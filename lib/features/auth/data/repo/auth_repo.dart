import 'package:dartz/dartz.dart';
import 'package:library_app/core/services/errors/failures.dart';

abstract class AuthRepo {
  //Login
  Future<Either<Failure, void>> signIn({
    required String email,
    required String password,
  });

  //Create New User
  Future<Either<Failure, void>> signUp({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, void>> isLoggedIn();
}
