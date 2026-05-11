part of 'books_cubit.dart';

abstract class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksSuccess extends BooksState { 
  final List<ApiBookModel> books;

  BooksSuccess(this.books);
}

class BooksError extends BooksState { 
  final String message;

  BooksError({required this.message});
}