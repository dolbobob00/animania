import 'package:dio/dio.dart';
import '../models/banner_model.dart';

class BannerRepository {
  final Dio _dio;

  BannerRepository(this._dio);

  Future<List<BannerModel>> getBanners() async {
    try {
      final response = await _dio.get('/banners');
      return (response.data as List)
          .map((json) => BannerModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load banners');
    }
  }
}
