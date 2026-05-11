import 'package:flutter/material.dart';

class SearchSectionTitle extends StatelessWidget {
  final IconData icon;

  final String title;

  const SearchSectionTitle({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xff2563EB)),

        const SizedBox(width: 8),

        Text(
          title,

          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xff0F172A),
          ),
        ),
      ],
    );
  }
}
