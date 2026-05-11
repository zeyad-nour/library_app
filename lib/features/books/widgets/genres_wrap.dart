import 'package:flutter/material.dart';

class GenresWrap extends StatelessWidget {
  final List<String> genres;

  const GenresWrap({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,

      children: List.generate(genres.length, (index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),

          decoration: BoxDecoration(
            color: const Color(0xffF8FAFC),

            borderRadius: BorderRadius.circular(30),
          ),

          child: Text(
            genres[index],

            style: const TextStyle(
              color: Color(0xff2563EB),
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }),
    );
  }
}
