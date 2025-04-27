part of 'restaurant_details_cubit.dart';

class RestaurantDetailsState extends Equatable {
  final Map<String, List<FoodModel>> foodsByCategory;
  final bool isLoading;
  final String? error;

  const RestaurantDetailsState({
    this.foodsByCategory = const {},
    this.isLoading = false,
    this.error,
  });

  @override
  List<Object?> get props => [foodsByCategory, isLoading, error];

  RestaurantDetailsState copyWith({
    Map<String, List<FoodModel>>? foodsByCategory,
    bool? isLoading,
    String? error,
  }) {
    return RestaurantDetailsState(
      foodsByCategory: foodsByCategory ?? this.foodsByCategory,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
