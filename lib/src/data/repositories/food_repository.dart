import 'package:dio/dio.dart';
import '../models/food_model.dart';

class FoodRepository {
  final Dio _dio;

  FoodRepository(this._dio);

  Future<List<FoodModel>> getFoodList() async {
    try {
      final response = await _dio.get('/foods');
      return (response.data as List)
          .map((json) => FoodModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load food list');
    }
  }

  Future<FoodModel> getFoodDetails(String id) async {
    try {
      final response = await _dio.get('/foods/$id');
      return FoodModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load food details');
    }
  }
}
