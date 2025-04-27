part of 'food_category_cubit.dart';

sealed class FoodCategoryState extends Equatable {
  final List<FoodModel> foods;
  final bool isLoading;
  final String? error;

  const FoodCategoryState({
    this.foods = const [],
    this.isLoading = false,
    this.error,
  });

  @override
  List<Object?> get props => [foods, isLoading, error];
}

class FoodCategoryInitial extends FoodCategoryState {}

class FoodCategoryLoading extends FoodCategoryState {
  const FoodCategoryLoading() : super(isLoading: true);
}

class FoodCategoryLoaded extends FoodCategoryState {
  const FoodCategoryLoaded(List<FoodModel> foods) : super(foods: foods);
}

class FoodCategoryError extends FoodCategoryState {
  const FoodCategoryError(String error) : super(error: error);
}
