class UserModel {
  static const collectionName = "users";
  static late UserModel currentUser;
  late String id;
  late String name;
  late String email;
  late List<String> favorites;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.favorites,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    // parse with safety: convert to strings and provide defaults when null
    id = json["id"]?.toString() ?? '';
    name = json["name"]?.toString() ?? '';
    email = json["email"]?.toString() ?? '';
    final favRaw = json["favorites"];
    if (favRaw is List) {
      favorites = favRaw.map((e) => e?.toString() ?? '').where((s) => s.isNotEmpty).toList();
    } else {
      favorites = [];
    }
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "favorites": favorites, "id": id};
  }

  bool isFavorite(String eventId) => favorites.contains(eventId);

}
