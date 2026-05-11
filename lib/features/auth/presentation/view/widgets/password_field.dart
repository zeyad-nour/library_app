import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.onToggle,
  });

  final TextEditingController controller;

  final bool obscureText;

  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          "Password",

          style: TextStyle(fontSize: 16, color: Color(0xff0F172A)),
        ),

        const SizedBox(height: 10),

        TextField(
          controller: controller,

          obscureText: obscureText,

          decoration: InputDecoration(
            hintText: "Enter your password",

            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Color(0xff64748B),
            ),

            suffixIcon: IconButton(
              onPressed: onToggle,

              icon: Icon(
                obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,

                color: const Color(0xff64748B),
              ),
            ),

            filled: true,
            fillColor: Colors.white,

            contentPadding: const EdgeInsets.symmetric(vertical: 20),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),

              borderSide: const BorderSide(color: Color(0xffE2E8F0)),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),

              borderSide: const BorderSide(color: Color(0xffE2E8F0)),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),

              borderSide: const BorderSide(color: Color(0xff2563EB), width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
