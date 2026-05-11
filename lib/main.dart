import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/services/api_services/api_service.dart';
import 'package:library_app/features/auth/data/repo/auth_repo.dart';
import 'package:library_app/features/auth/data/repo/auth_repo_implement.dart';
import 'package:library_app/features/books/data/repo/books_repo.dart';

import 'core/routes/app_routes.dart';

import 'features/profile/cubit/profile_cubit.dart';
import 'features/profile/cubit/profile_state.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BooksRepo>(
          create: (_) => BooksRepo(ApiService(Dio())),
        ),

        
        RepositoryProvider<AuthRepo>(
          create: (_) => AuthRepoImpl( FirebaseAuth.instance),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ProfileCubit()),
        ],
        child: const ReadoraApp(),
      ),
    ),
  );
}
class ReadoraApp extends StatelessWidget {
  const ReadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = context.watch<ProfileCubit>();

        return MaterialApp(
          debugShowCheckedModeBanner: false,

          onGenerateRoute: AppRoutes.generateRoute,

          initialRoute: AppRoutes.splash,

          themeMode: cubit.darkMode ? ThemeMode.dark : ThemeMode.light,

          theme: AppTheme.lightTheme,

          darkTheme: AppTheme.darkTheme,
        );
      },
    );
  }
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,

      scaffoldBackgroundColor: const Color(0xffF8FAFC),

      fontFamily: 'Poppins',

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff2563EB)),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,

      scaffoldBackgroundColor: const Color(0xff0F172A),

      fontFamily: 'Poppins',

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff1E293B),
        elevation: 0,
      ),

      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xff2563EB),
        brightness: Brightness.dark,
      ),
    );
  }
}
