part of 'restaurant_list_cubit.dart';

sealed class RestaurantListState extends Equatable {
  final List<RestaurantModel> restaurants;
  final bool isLoading;
  final String? category;
  final String? error;

  const RestaurantListState({
    this.category,
    this.restaurants = const [],
    this.isLoading = false,
    this.error,
  });

  @override
  List<Object?> get props => [restaurants, isLoading, error, category];
}

class RestaurantListInitial extends RestaurantListState {
  const RestaurantListInitial() : super();
}

class RestaurantListLoading extends RestaurantListState {
  const RestaurantListLoading() : super(isLoading: true);
}

class RestaurantListLoaded extends RestaurantListState {
  const RestaurantListLoaded(
      List<RestaurantModel> restaurants, String? category)
      : super(restaurants: restaurants, category: category);
}

class RestaurantListError extends RestaurantListState {
  const RestaurantListError(String error) : super(error: error);
}
