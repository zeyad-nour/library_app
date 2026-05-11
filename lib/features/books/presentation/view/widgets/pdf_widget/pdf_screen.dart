import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

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
  String? filePath;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    loadPdf();
  }

  Future<void> loadPdf() async {
    try {
      final dir = await getTemporaryDirectory();

      final file = File("${dir.path}/book.pdf");

      await Dio().download(widget.pdfUrl, file.path);

      setState(() {
        filePath = file.path;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Read Book")),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : filePath == null
              ? const Center(
                  child: Text("Failed to load PDF"),
                )
              : PDFView(
                  filePath: filePath!,
                ),
    );
  }
}