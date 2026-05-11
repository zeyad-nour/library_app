class ApiBookModel {
  final String title;
  final String author;
  final String description;
  final String image;
  final String publisher;
  final String language;
  final String year;
  final String pdfUrl;

  ApiBookModel({
    required this.title,
    required this.author,
    required this.description,
    required this.image,
    required this.publisher,
    required this.language,
    required this.year,
    required this.pdfUrl,
  });

  factory ApiBookModel.fromJson(Map<String, dynamic> json) {
    final v = json['volumeInfo'];

    return ApiBookModel(
      title: v['title'] ?? '',
      author: (v['authors'] ?? ['Unknown'])[0],
      description: v['description'] ?? '',
      image: v['imageLinks']?['thumbnail'] ?? '',
      publisher: v['publisher'] ?? 'Unknown',
      language: v['language'] ?? 'en',
      year: (v['publishedDate'] ?? '').toString(),

      // 👇 أهم سطر
      pdfUrl: json['accessInfo']?['pdf']?['downloadLink'] ?? '',
    );
  }
}