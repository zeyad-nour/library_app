part of 'books_cubit.dart';

abstract class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksLoaded extends BooksState {}

class BooksError extends BooksState {}