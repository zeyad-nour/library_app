import 'package:flutter/material.dart';

import 'search_section_title.dart';

class TrendingSearches extends StatelessWidget {
  final List items;

  final Function(String) onTap;

  const TrendingSearches({super.key, required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const SearchSectionTitle(
          icon: Icons.trending_up,
          title: "Trending Searches",
        ),

        const SizedBox(height: 20),

        Wrap(
          spacing: 12,
          runSpacing: 12,

          children: items.map((term) {
            return GestureDetector(
              onTap: () => onTap(term),

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(30),

                  border: Border.all(color: const Color(0xffE2E8F0)),
                ),

                child: Text(
                  term,

                  style: const TextStyle(color: Color(0xff64748B)),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
