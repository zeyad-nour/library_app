import 'package:flutter/material.dart';

import '../core/routes/app_routes.dart';

class ReadoraApp extends StatelessWidget {
  const ReadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Readora',

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF8FAFC),

        fontFamily: 'Poppins',
      ),

      initialRoute: AppRoutes.splash,

      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
