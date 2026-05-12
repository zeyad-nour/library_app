import 'package:flutter/material.dart';
import 'package:library_app/features/auth/presentation/view/widgets/auth_logo.dart';

class verificationScreen extends StatelessWidget {
  const verificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Column(children: [AuthLogo()])),
    );
  }
}
