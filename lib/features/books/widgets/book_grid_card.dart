import 'package:flutter/material.dart';

class BookGridCard extends StatelessWidget {
  final String title;
  final String author;
  final String image;
  final double rating;

  const BookGridCard({
    super.key,
    required this.title,
    required this.author,
    required this.image,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),

                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.08),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,

            maxLines: 2,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff0F172A),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            author,

            maxLines: 1,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(color: Color(0xff64748B), fontSize: 13),
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 18),

              const SizedBox(width: 4),

              Text(
                "$rating",

                style: const TextStyle(color: Color(0xff64748B), fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
