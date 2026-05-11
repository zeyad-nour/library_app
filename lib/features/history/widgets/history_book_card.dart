// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'completed_badge.dart';

class HistoryBookCard extends StatelessWidget {
  final String title;
  final String author;
  final String image;
  final double rating;
  final String completedDate;
  final String borrowDate;

  const HistoryBookCard({
    super.key,
    required this.title,
    required this.author,
    required this.image,
    required this.rating,
    required this.completedDate,
    required this.borrowDate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 22),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),

                        child: Image.network(
                          image,
                          width: 95,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const Positioned(
                        top: -2,
                        right: -2,
                        child: CompletedBadge(),
                      ),
                    ],
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          title,

                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,

                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0F172A),
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          author,

                          style: const TextStyle(
                            color: Color(0xff64748B),
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 14),

                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),

                            const SizedBox(width: 5),

                            Text(
                              "$rating",

                              style: const TextStyle(color: Color(0xff64748B)),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Color(0xff64748B),
                              size: 18,
                            ),

                            const SizedBox(width: 6),

                            Expanded(
                              child: Text(
                                "Completed: $completedDate",

                                style: const TextStyle(
                                  color: Color(0xff64748B),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),

              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    "Borrowed: $borrowDate",

                    style: const TextStyle(
                      color: Color(0xff64748B),
                      fontSize: 14,
                    ),
                  ),

                  const Text(
                    "Read Again",

                    style: TextStyle(
                      color: Color(0xff2563EB),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
