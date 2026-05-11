import 'package:flutter/material.dart';

class BookModel {
  final String title;
  final String author;
  final String image;
  final double rating;
  final String name;
  final String email;

  final IconData? icon;
  final Color? color;

  final List<String> genres;
  final String publisher;
  final String language;
  final int year;

  final int reviews;
  final int pages;

  final String description;
  final String completedDate;
  final String borrowDate;

  final String dueDate;
  final int daysLeft;

  BookModel({
    required this.title,
    required this.author,
    required this.image,
    required this.rating,

    this.genres = const [],
    this.publisher = '',
    this.language = '',
    this.year = 2025,
    this.reviews = 0,
    this.pages = 0,
    this.name = '',
    this.email = '',

    this.icon,
    this.color,

    this.description = '',
    this.completedDate = '',
    this.borrowDate = '',

    this.dueDate = '',
    this.daysLeft = 0,
    required String category,
  });
}
