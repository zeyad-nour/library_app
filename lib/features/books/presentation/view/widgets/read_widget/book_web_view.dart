import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookWebView extends StatefulWidget {
  final String url;

  const BookWebView({
    super.key,
    required this.url,
  });

  @override
  State<BookWebView> createState() => _BookWebViewState();
}

class _BookWebViewState extends State<BookWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read Book"),
      ),

      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}