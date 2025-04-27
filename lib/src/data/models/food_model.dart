class FoodModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final double? discount;
  final List<String> ingredients;
  final bool isAvailable;
  final int preparationTime;
  
  const FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.discount,
    this.ingredients = const [],
    this.isAvailable = true,
    this.preparationTime = 15,
  });

  double get finalPrice {
    if (discount != null && discount! > 0) {
      return price - (price * discount! / 100);
    }
    return price;
  }

  FoodModel copyWith({
    String? name,
    double? price,
    double? discount,
    bool? isAvailable,
  }) {
    return FoodModel(
      id: id,
      name: name ?? this.name,
      description: description,
      price: price ?? this.price,
      imageUrl: imageUrl,
      category: category,
      discount: discount ?? this.discount,
      ingredients: ingredients,
      isAvailable: isAvailable ?? this.isAvailable,
      preparationTime: preparationTime,
    );
  }

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String,
      discount: json['discount'] != null ? (json['discount'] as num).toDouble() : null,
      ingredients: List<String>.from(json['ingredients'] ?? []),
      isAvailable: json['isAvailable'] as bool? ?? true,
      preparationTime: json['preparationTime'] as int? ?? 15,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
      'discount': discount,
      'ingredients': ingredients,
      'isAvailable': isAvailable,
      'preparationTime': preparationTime,
    };
  }
}
