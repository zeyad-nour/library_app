import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/app_routes.dart';

import 'features/profile/cubit/profile_cubit.dart';
import 'features/profile/cubit/profile_state.dart';

void main() {
  runApp(
    BlocProvider(create: (_) => ProfileCubit(), child: const ReadoraApp()),
  );
}

class ReadoraApp extends StatelessWidget {
  const ReadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();

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
