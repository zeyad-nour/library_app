import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookWebView extends StatefulWidget {
  final String url;

  const BookWebView({super.key, required this.url});

  @override
  State<BookWebView> createState() => _BookWebViewState();
}

class _BookWebViewState extends State<BookWebView> {
  late final WebViewController controller;

  bool loading = true;

  @override
  void initState() {
    super.initState();

    final uri = Uri.parse(widget.url);

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) => setState(() => loading = false),
          onWebResourceError: (_) => setState(() => loading = false),
        ),
      )
      ..loadRequest(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Preview")),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (loading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
