import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String title;
  final String hint;
  final IconData icon;
  final TextEditingController controller;

  const AuthTextField({
    super.key,
    required this.title,
    required this.hint,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,

          style: const TextStyle(fontSize: 16, color: Color(0xff0F172A)),
        ),

        const SizedBox(height: 10),

        TextField(
          controller: controller,

          decoration: InputDecoration(
            hintText: hint,

            prefixIcon: Icon(icon, color: const Color(0xff64748B)),

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
