import 'package:flutter/material.dart';

class DetailsInfoRow extends StatelessWidget {
  final String title;
  final String value;

  const DetailsInfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(
            title,

            style: const TextStyle(color: Color(0xff64748B), fontSize: 15),
          ),

          Text(
            value,

            style: const TextStyle(
              color: Color(0xff0F172A),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
