class RecommendedModel {
  final String title;
  final String author;
  final String image;

  RecommendedModel({
    required this.title,
    required this.author,
    required this.image,
  });

  factory RecommendedModel.fromJson(Map<String, dynamic> json) {
    final v = json['volumeInfo'];

    return RecommendedModel(
      title: v['title'] ?? '',
      author: (v['authors'] ?? ['Unknown'])[0],
      image: (v['imageLinks']?['thumbnail'] ?? '').replaceAll('http://', 'https://'),
    );
  }
}