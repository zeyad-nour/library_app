import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PdfScreen extends StatefulWidget {
  final String pdfUrl;

  const PdfScreen({
    super.key,
    required this.pdfUrl,
  });

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  late final WebViewController controller;

  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();

    final fixedUrl = widget.pdfUrl.replaceFirst(
      "http://",
      "https://",
    );

    controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0xffF8FAFC))
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (String url) {
                setState(() {
                  isLoading = true;
                });
              },

              onPageFinished: (String url) {
                setState(() {
                  isLoading = false;
                });
              },

              onWebResourceError: (error) {
                setState(() {
                  hasError = true;
                  isLoading = false;
                });
              },
            ),
          )
          ..loadRequest(Uri.parse(fixedUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Read Book",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Stack(
        children: [
          if (!hasError)
            WebViewWidget(
              controller: controller,
            ),

          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),

          if (hasError)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 80,
                      color: Colors.red,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Failed to load book",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "This book preview is not available right now.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 25),

                    ElevatedButton(
                      onPressed: () {
                        final fixedUrl = widget.pdfUrl.replaceFirst(
                          "http://",
                          "https://",
                        );

                        controller.loadRequest(
                          Uri.parse(fixedUrl),
                        );

                        setState(() {
                          hasError = false;
                          isLoading = true;
                        });
                      },

                      child: const Text("Try Again"),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}