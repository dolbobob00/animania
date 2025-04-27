import 'package:animania/src/data/models/promotion_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/restaurant_model.dart';
import '../../../../data/repositories/restaurant_repository.dart';

part 'restaurant_list_state.dart';

class RestaurantListCubit extends Cubit<RestaurantListState> {
  final IRestaurantRepository _repository;

  RestaurantListCubit(this._repository)
      : super(
          const RestaurantListInitial(),
        );
  static final List<RestaurantModel> mockRestaurants = [
    RestaurantModel(
      id: '1',
      name: 'Italian Paradise',
      imageUrls: [
        'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3'
      ],
      isFavorite: true,
      promotions: [
        PromotionModel(
          id: '123',
          title: 'Easy nuggets',
          description: 'Get free nuggets',
          discountPercentage: 20,
          startDate: DateTime(2023, 10, 1),
          endDate: DateTime(2026, 10, 31),
          imageUrl: 'https://example.com/image.jpg',
          code: 'NUGGETS20',
        ),
      ],
      slogan: 'Best Italian food in town',
      closingTime: const TimeOfDay(hour: 12, minute: 0),
      openingTime: const TimeOfDay(hour: 8, minute: 0),
      priceLevel: 3,
      rating: 4.7,
      deliveryTimeMinutes: 30,
      cuisine: 'Italian',
    ),
    RestaurantModel(
      id: '2',
      name: 'Sushi Master',
      imageUrls: [
        'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?ixlib=rb-4.0.3'
      ],
      slogan: 'Best sushi in town',
      isFavorite: false,
      closingTime: const TimeOfDay(hour: 2, minute: 0),
      openingTime: const TimeOfDay(hour: 1, minute: 0),
      promotions: [],
      priceLevel: 4,
      rating: 4.9,
      deliveryTimeMinutes: 45,
      cuisine: 'Japanese',
    ),
    RestaurantModel(
      id: '23',
      name: 'Sushi Master',
      imageUrls: [
        'https://images.unsplash.com/photo-1579871494447-9811cf80d66c'
      ],
      isFavorite: false,
      promotions: [],
      priceLevel: 4,
      rating: 4.9,
      closingTime: const TimeOfDay(hour: 18, minute: 0),
      openingTime: const TimeOfDay(hour: 8, minute: 0),
      deliveryTimeMinutes: 45,
      cuisine: 'Japanese',
    ),
    // Add more mock restaurants as needed
  ];
  Future<void> loadRestaurants({String? category}) async {
    emit(const RestaurantListLoading());
    try {
      emit(RestaurantListLoaded(
        mockRestaurants,
        category,
      ));
      // final restaurants = await _repository.getRestaurants();
      // emit(RestaurantListLoaded(restaurants));
    } catch (e) {
      emit(RestaurantListError(e.toString()));
    }
  }

  Future<void> toggleFavorite(String restaurantId) async {
    if (state is RestaurantListLoaded) {
      final currentState = state as RestaurantListLoaded;
      final updatedRestaurants = currentState.restaurants.map((restaurant) {
        if (restaurant.id == restaurantId) {
          return restaurant.copyWith(isFavorite: !restaurant.isFavorite);
        }
        return restaurant;
      }).toList();

      emit(RestaurantListLoaded(updatedRestaurants, currentState.category));
    }
  }
}
