import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/borrowed_books_data.dart';
import 'borrowed_state.dart';

class BorrowedCubit extends Cubit<BorrowedState> {
  BorrowedCubit() : super(BorrowedInitial());

  final books = borrowedBooks;
}
