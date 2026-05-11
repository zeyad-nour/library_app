import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const SectionTitle({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xff2563EB)),

            const SizedBox(width: 8),

            Text(
              title,

              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ],
        ),

        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/books');
          },

          child: const Text(
            "See All",

            style: TextStyle(
              color: Color(0xff2563EB),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
