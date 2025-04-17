class FoodModel {
  String? id;
  String? name;
  String? imageUrl;
  String? description;
  double? price;
  int? quantity;

  FoodModel({
    this.id,
    this.name,
    this.imageUrl,
    this.description,
    this.price,
    this.quantity,
  });

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['description'] = description;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }
}
