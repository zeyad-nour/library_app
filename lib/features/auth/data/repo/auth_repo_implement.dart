import 'package:dartz/dartz.dart';
import 'package:library_app/core/services/errors/failures.dart';
import 'package:library_app/features/auth/data/repo/auth_repo.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth _auth;

  AuthRepoImpl(this._auth);

  @override
  Future<Either<Failure, void>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailuer(e.message ?? "Login failed"));
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await result.user?.updateDisplayName(name);

      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailuer(e.message ?? "Signup failed"));
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _auth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final user = _auth.currentUser;
      return Right(user != null);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }
}
