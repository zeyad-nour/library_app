import 'package:flutter/material.dart';

import 'search_section_title.dart';

class RecentSearches extends StatelessWidget {
  final List items;

  final Function(String) onTap;

  const RecentSearches({super.key, required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const SearchSectionTitle(
          icon: Icons.access_time,
          title: "Recent Searches",
        ),

        const SizedBox(height: 20),

        Column(
          children: items.map((term) {
            return Container(
              margin: const EdgeInsets.only(bottom: 14),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),

              child: ListTile(
                onTap: () => onTap(term),

                leading: const Icon(
                  Icons.access_time,
                  color: Color(0xff64748B),
                ),

                title: Text(
                  term,

                  style: const TextStyle(color: Color(0xff0F172A)),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
