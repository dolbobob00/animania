import 'package:flutter/material.dart';

class PromotionModel {
  final String id;
  final String title;
  final String description;
  final double discountPercentage;
  final DateTime startDate;
  final DateTime endDate;
  final String imageUrl;
  final String code;
  final bool isActive;
  final List<String> applicableCategories;
  final double minimumOrderAmount;

  const PromotionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.discountPercentage,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
    required this.code,
    this.isActive = true,
    this.applicableCategories = const [],
    this.minimumOrderAmount = 0.0,
  });

  factory PromotionModel.fromJson(Map<String, dynamic> json) {
    return PromotionModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      discountPercentage: json['discountPercentage'] as double,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      imageUrl: json['imageUrl'] as String,
      code: json['code'] as String,
      isActive: json['isActive'] as bool? ?? true,
      applicableCategories: List<String>.from(json['applicableCategories'] ?? []),
      minimumOrderAmount: json['minimumOrderAmount'] as double? ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'discountPercentage': discountPercentage,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'imageUrl': imageUrl,
      'code': code,
      'isActive': isActive,
      'applicableCategories': applicableCategories,
      'minimumOrderAmount': minimumOrderAmount,
    };
  }

  PromotionModel copyWith({
    String? id,
    String? title,
    String? description,
    double? discountPercentage,
    DateTime? startDate,
    DateTime? endDate,
    String? imageUrl,
    String? code,
    bool? isActive,
    List<String>? applicableCategories,
    double? minimumOrderAmount,
  }) {
    return PromotionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      imageUrl: imageUrl ?? this.imageUrl,
      code: code ?? this.code,
      isActive: isActive ?? this.isActive,
      applicableCategories: applicableCategories ?? this.applicableCategories,
      minimumOrderAmount: minimumOrderAmount ?? this.minimumOrderAmount,
    );
  }

  @override
  String toString() {
    return 'PromotionModel(id: $id, title: $title, discountPercentage: $discountPercentage%)';
  }
}
