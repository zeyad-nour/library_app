// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/auth/data/repo/auth_repo.dart';
import 'package:library_app/features/auth/presentation/view/screens/login_screen.dart';

import '../../state_mangement/cubit/auth_cubit.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_logo.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/password_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(context.read<AuthRepo>()),

      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Verification email sent. Please check your email.",
                ),
              ),
            );

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginScreen()),
            );
          }

          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },

        builder: (context, state) {
          final cubit = context.watch<AuthCubit>();

          return Scaffold(
            backgroundColor: const Color(0xffF8FAFC),

            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),

                  child: Column(
                    children: [
                      const SizedBox(height: 40),

                      const AuthLogo(),

                      const SizedBox(height: 40),

                      AuthTextField(
                        title: "Full Name",
                        hint: "Enter your name",
                        icon: Icons.person_outline,
                        controller: nameController,
                      ),

                      const SizedBox(height: 22),

                      AuthTextField(
                        title: "Email",
                        hint: "Enter your email",
                        icon: Icons.mail_outline,
                        controller: emailController,
                      ),

                      const SizedBox(height: 22),

                      PasswordField(
                        controller: passwordController,
                        obscureText: !cubit.showPassword,
                        onToggle: cubit.togglePasswordVisibility,
                      ),

                      const SizedBox(height: 30),

                      state is AuthLoading
                          ? const CircularProgressIndicator()
                          : AuthButton(
                              text: "Sign Up",
                              onTap: () {
                                cubit.register(
                                  name: nameController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              },
                            ),

                      const SizedBox(height: 20),

                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
