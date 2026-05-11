import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_logo.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/password_field.dart';

bool isValidEmail(String email) {
  return email.contains("@") && email.contains(".com");
}

bool isStrongPassword(String password) {
  return password.length >= 8;
}

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),

      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();

          return Scaffold(
            backgroundColor: const Color(0xffF8FAFC),

            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),

                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      const SizedBox(height: 40),

                      const AuthLogo(),

                      const SizedBox(height: 28),

                      const Text(
                        "Create Account",

                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0F172A),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Join Readora today",

                        style: TextStyle(
                          color: Color(0xff64748B),
                          fontSize: 16,
                        ),
                      ),

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

                        onToggle: () {
                          cubit.togglePasswordVisibility();
                        },
                      ),

                      const SizedBox(height: 35),

                      AuthButton(
                        text: "Sign Up",

                        onTap: () {
                          if (!isValidEmail(emailController.text)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Enter valid email"),
                              ),
                            );
                            return;
                          }

                          if (!isStrongPassword(passwordController.text)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Password must contain capital, small, number and symbol",
                                ),
                              ),
                            );
                            return;
                          }

                          cubit.register(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                      ),
                      const SizedBox(height: 28),

                      AuthFooter(
                        text: "Already have an account?",
                        actionText: "Sign In",

                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),

                      const SizedBox(height: 30),
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
