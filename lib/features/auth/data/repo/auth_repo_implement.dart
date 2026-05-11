import 'package:dartz/dartz.dart';
import 'package:library_app/core/services/errors/failures.dart';
import 'package:library_app/features/auth/data/repo/auth_repo.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth firebaseAuth;

  AuthRepoImpl(this.firebaseAuth);

  @override
  Future<Either<Failure, void>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(null);
    } catch (e) {
      return left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(null);
    } catch (e) {
      return left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    await firebaseAuth.signOut();
    return right(null);
  }

  @override
  Future<Either<Failure, void>> isLoggedIn() async {
    final user = firebaseAuth.currentUser;

    return right(user != null ? null : null);
  }
}