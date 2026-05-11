import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/books/data/model/api_book_model.dart';

import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/auth/screens/splash_screen.dart';

import '../../features/books/presentation/view/book_details_screen.dart';
import '../../features/books/presentation/view/books_list_screen.dart';

import '../../features/history/screens/history_screen.dart';

import '../../features/home/cubit/home_cubit.dart';
import '../../features/home/screens/home_screen.dart';

class AppRoutes {
  static const splash = "/";

  static const login = "/login";

  static const register = "/register";

  static const home = "/home";

  static const books = "/books";

  static const details = "/details";

  static const history = "/history";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeScreen(),
          ),
        );
      case books:
        final category = settings.arguments as String;

        return MaterialPageRoute(
          builder: (_) => BooksListScreen(category: category),
        );

      case details:
        final book = settings.arguments as ApiBookModel;

        return MaterialPageRoute(builder: (_) => BookDetailsScreen(book: book));

      case history:
        return MaterialPageRoute(builder: (_) => HistoryScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
