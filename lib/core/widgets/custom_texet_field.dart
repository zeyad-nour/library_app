import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;

  final IconData icon;

  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      decoration: InputDecoration(
        hintText: hint,

        prefixIcon: Icon(icon),

        filled: true,

        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),

          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
