import 'package:flutter/material.dart';

class DarkModeTile extends StatelessWidget {
  final bool value;

  final VoidCallback onChanged;

  const DarkModeTile({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,

      onChanged: (_) => onChanged(),

      title: const Text(
        "Dark Mode",

        style: TextStyle(color: Color(0xff0F172A), fontWeight: FontWeight.w500),
      ),

      secondary: const Icon(Icons.dark_mode_outlined, color: Color(0xff64748B)),
    );
  }
}
