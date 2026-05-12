import 'package:flutter/material.dart';
import 'package:library_app/features/books/data/model/api_book_model.dart';
import 'package:library_app/features/books/presentation/view/widgets/read_widget/book_web_view.dart';
import 'package:library_app/features/books/presentation/view/widgets/read_widget/pdf_screen.dart';


class DetailsActionBar extends StatelessWidget {
  final ApiBookModel book;

  const DetailsActionBar({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,

      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 18,
        ),

        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color(0xffE2E8F0),
            ),
          ),
        ),

        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),

                border: Border.all(
                  color: const Color(0xff2563EB),
                  width: 2,
                ),
              ),

              child: IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Book saved"),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.bookmark_add_outlined,
                  color: Color(0xff2563EB),
                ),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: SizedBox(
                height: 58,

                child: ElevatedButton(
                  onPressed: () {
                    if (book.pdfUrl.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PdfScreen(
                            pdfUrl: book.pdfUrl,
                          ),
                        ),
                      );

                      return;
                    }

                    if (book.webReaderLink.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookWebView(
                            url: book.webReaderLink,
                          ),
                        ),
                      );

                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Book preview not available",
                        ),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2563EB),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: const [
                      Icon(
                        Icons.menu_book_rounded,
                        color: Colors.white,
                      ),

                      SizedBox(width: 10),

                      Text(
                        "Read Book",

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}