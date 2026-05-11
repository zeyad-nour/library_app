import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/home/widgets/main_screen.dart';

import '../../state_mangement/cubit/auth_cubit.dart';
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

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
                      const AuthLogo(),
                  
                      const SizedBox(height: 30),
                  
                      const Text(
                        "Welcome Back",
                  
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0F172A),
                        ),
                      ),
                  
                      const SizedBox(height: 8),
                  
                      const Text(
                        "Sign in to continue reading",
                  
                        style: TextStyle(color: Color(0xff64748B), fontSize: 16),
                      ),
                  
                      const SizedBox(height: 45),
                  
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
                  
                        onToggle: () {
                          cubit.togglePasswordVisibility();
                        },
                      ),
                  
                      const SizedBox(height: 16),
                  
                      Align(
                        alignment: Alignment.centerLeft,
                  
                        child: TextButton(
                          onPressed: () {},
                  
                          child: const Text(
                            "Forgot Password?",
                  
                            style: TextStyle(color: Color(0xff2563EB)),
                          ),
                        ),
                      ),
                  
                      const SizedBox(height: 10),
                  
                      AuthButton(
                        text: "Sign In",
                  
                        onTap: () {
                          if (!isValidEmail(emailController.text)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Enter valid email")),
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
                  
                          cubit.login(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                  
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const MainScreen()),
                          );
                        },
                      ),
                  
                      const SizedBox(height: 30),
                  
                      AuthFooter(
                        text: "Don't have an account?",
                        actionText: "Sign Up",
                  
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
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
