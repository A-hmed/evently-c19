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
    id = json["id"];
    name = json["name"];
    email = json["email"];
    favorites = (json["favorites"] as List<dynamic>).map((id) => id.toString()).toList();
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "favorites": favorites, "id": id};
  }

  bool isFavorite(String eventId) => favorites.contains(eventId);

}
