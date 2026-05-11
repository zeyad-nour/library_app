// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/splash_logo.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
      lowerBound: 0.9,
      upperBound: 1.1,
    )..repeat(reverse: true);

    Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff2563EB), Color(0xff60A5FA)],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SplashLogo(controller: controller),

            const SizedBox(height: 25),

            const Text(
              "Readora",

              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Your Digital Library",

              style: TextStyle(
                color: Colors.white.withOpacity(.85),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
