import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String image;
  final double rating;

  const BookCard({
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
        // Navigator.pushNamed(context, '/details');
      },

      child: Container(
        width: 145,
        margin: const EdgeInsets.only(right: 18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 10),

            Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),

            Text(author),

            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),

                const SizedBox(width: 4),

                Text("$rating"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
