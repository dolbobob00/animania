import 'package:animania/src/data/models/promotion_model.dart';
import 'package:flutter/material.dart';

class RestaurantModel {
  final String id;
  final String name;
  final List<String> imageUrls;
  final bool isFavorite;
  final List<PromotionModel> promotions;
  final int priceLevel;
  final double rating;
  final int deliveryTimeMinutes;
  final String cuisine;
  final String slogan;
  final TimeOfDay? openingTime;
  final TimeOfDay? closingTime;
  final String? address;
  final List<String> foodCategories;

  const RestaurantModel({
    required this.id,
    this.openingTime = const TimeOfDay(hour: 0, minute: 0),
    this.closingTime = const TimeOfDay(hour: 10, minute: 10),
    this.address = 'Address isn\'t set',
    this.slogan = '',
    this.foodCategories = const ['Горячие блюда', 'Завтраки', 'Напитки', 'Десерты'],
    required this.name,
    required this.imageUrls,
    this.isFavorite = false,
    this.promotions = const [],
    required this.priceLevel,
    required this.rating,
    required this.deliveryTimeMinutes,
    required this.cuisine,
  });

  RestaurantModel copyWith({
    bool? isFavorite,
    List<PromotionModel>? promotions,
  }) {
    return RestaurantModel(
      id: id,
      name: name,
      imageUrls: imageUrls,
      isFavorite: isFavorite ?? this.isFavorite,
      promotions: promotions ?? this.promotions,
      priceLevel: priceLevel,
      rating: rating,
      deliveryTimeMinutes: deliveryTimeMinutes,
      cuisine: cuisine,
      slogan: slogan,
      openingTime: openingTime,
      closingTime: closingTime,
      address: address,
    );
  }
}
