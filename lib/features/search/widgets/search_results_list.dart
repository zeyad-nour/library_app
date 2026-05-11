import 'package:flutter/material.dart';

import 'search_result_card.dart';

class SearchResultsList extends StatelessWidget {
  final List books;

  const SearchResultsList({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(24),

      itemCount: books.length,

      itemBuilder: (context, index) {
        return SearchResultCard(book: books[index]);
      },
    );
  }
}
