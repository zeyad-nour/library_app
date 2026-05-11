import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/data/books_data.dart';

import '../../../models/book_model.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final TextEditingController searchController = TextEditingController();

  List<BookModel> results = [];

  bool isSearching = false;

  List<String> recent = [];

  final List<String> trending = [
    "Atomic Habits",
    "Finance",
    "Self Help",
    "Psychology",
  ];

  void handleSearch(String value) {
    if (value.trim().isEmpty) {
      isSearching = false;
      results = [];
      emit(SearchInitial());
      return;
    }

    isSearching = true;

    results = booksData.where((book) {
      return book.title.toLowerCase().contains(value.toLowerCase()) ||
          book.author.toLowerCase().contains(value.toLowerCase());
    }).toList();

    if (!recent.contains(value)) {
      recent.insert(0, value);
    }

    emit(SearchInitial());
  }
}
