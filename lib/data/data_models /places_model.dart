

class PlacesModel {
  String name;
  String place;
  double rating;
  int price;
  String description;
  List<Map<String , dynamic>> users;
  String? imageUrl;

  PlacesModel({
    required this.name,
    required this.place,
    required this.rating,
    required this.price,
    required this.description,
    required this.users,
    this.imageUrl,
  });

  factory PlacesModel.fromJson(Map<String, dynamic> json) {
    return PlacesModel(
      name: json['name'],
      place: json['place'],
      rating: json['rating'].toDouble(),
      price: json['price'],
      description: json['description'],
      users: List<Map<String , dynamic>>.from(json['users']),
    );
  }
}
