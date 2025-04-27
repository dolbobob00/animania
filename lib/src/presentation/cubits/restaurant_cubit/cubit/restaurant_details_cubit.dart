import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../data/models/food_model.dart';
import '../../../../data/models/restaurant_model.dart';

part 'restaurant_details_state.dart';

class RestaurantDetailsCubit extends Cubit<RestaurantDetailsState> {
  final RestaurantModel restaurant;

  RestaurantDetailsCubit(this.restaurant) : super(const RestaurantDetailsState()) {
    loadFoodsByCategories();
  }

  Future<void> loadFoodsByCategories() async {
    emit(state.copyWith(isLoading: true));

    try {
      // Mock data - replace with actual API call
      final mockFoods = {
        for (var category in restaurant.foodCategories)
          category: List.generate(
            3,
            (index) => FoodModel(
              id: '$index',
              name: '$category Item $index',
              description: 'Description for $category item $index',
              price: (index + 1) * 100.0,
              imageUrl: 'https://example.com/image.jpg',
              category: category,
            ),
          ),
      };

      emit(state.copyWith(
        foodsByCategory: mockFoods,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  List<FoodModel> getFoodsForCategory(String category) {
    return state.foodsByCategory[category] ?? [];
  }
}
