import 'dart:developer';

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
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // تحديث بيانات المستخدم
      await credential.user!.reload();

      // جلب المستخدم بعد التحديث
      final user = firebaseAuth.currentUser;

      // التحقق من تفعيل الإيميل
      if (user != null && !user.emailVerified) {
        await firebaseAuth.signOut();

        return left(ServerFailuer("Please verify your email first"));
      }

      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailuer(e.message ?? "Auth Error"));
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
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.updateDisplayName(name);

      await credential.user!.sendEmailVerification();
      log("||||||||||||||||||||EMAIL SENT|||||||||||||||||");
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailuer(e.message ?? "Auth Error"));
    } catch (e) {
      return left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    await FirebaseAuth.instance.signOut();

    return right(null);
  }

  @override
  Future<Either<Failure, void>> isLoggedIn() async {
    final user = firebaseAuth.currentUser;

    if (user != null) {
      return right(null);
    } else {
      return left(ServerFailuer("User not logged in"));
    }
  }
}
