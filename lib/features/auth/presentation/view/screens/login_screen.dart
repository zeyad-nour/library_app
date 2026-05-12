// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/auth/data/repo/auth_repo.dart';
import 'package:library_app/features/auth/presentation/view/screens/register_screen.dart';

import '../../state_mangement/cubit/auth_cubit.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_logo.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/password_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(context.read<AuthRepo>()),

      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, '/home');
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AuthLogo(),

                    const SizedBox(height: 30),

                    AuthTextField(
                      title: "Email",
                      hint: "Enter your email",
                      icon: Icons.mail_outline,
                      controller: emailController,
                    ),

                    const SizedBox(height: 24),

                    PasswordField(
                      controller: passwordController,
                      obscureText: !cubit.showPassword,
                      onToggle: cubit.togglePasswordVisibility,
                    ),

                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                          (Route) => false,
                        );
                      },
                      child: Text(
                        "I don`t have account",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),

                    state is AuthLoading
                        ? const CircularProgressIndicator()
                        : AuthButton(
                            text: "Sign In",
                            onTap: () {
                              cubit.login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
