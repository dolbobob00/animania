import 'package:animania/src/data/models/promotion_model.dart';
import 'package:dio/dio.dart';
import '../models/restaurant_model.dart';

abstract class IRestaurantRepository {
  Future<List<RestaurantModel>> getRestaurants();
}

class RestaurantRepository implements IRestaurantRepository {
  final Dio _dio;

  RestaurantRepository(this._dio);

  @override
  Future<List<RestaurantModel>> getRestaurants() async {
    try {
      final response = await _dio.get('/restaurants');
      return (response.data as List)
          .map((json) => RestaurantModel(
                id: json['id'],
                name: json['name'],
                imageUrls: List<String>.from(json['imageUrls']),
                isFavorite: json['isFavorite'] ?? false,
                promotions: List<PromotionModel>.from(json['promotions'] ?? []),
                priceLevel: json['priceLevel'],
                rating: json['rating'].toDouble(),
                deliveryTimeMinutes: json['deliveryTimeMinutes'],
                cuisine: json['cuisine'],
              ))
          .toList();
    } catch (e) {
      throw Exception('Failed to load restaurants');
    }
  }
}
