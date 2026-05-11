class UserModel {
  final String name;

  final String email;

  final String image;

  final List<Map<String, dynamic>> stats;

  final List<Map<String, dynamic>> menuItems;

  UserModel({
    required this.name,
    required this.email,
    required this.image,
    required this.stats,
    required this.menuItems,
  });
}
