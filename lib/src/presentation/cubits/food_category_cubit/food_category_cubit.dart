import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/food_model.dart';
import '../../../data/repositories/food_repository.dart';

part 'food_category_state.dart';

class FoodCategoryCubit extends Cubit<FoodCategoryState> {
  final FoodRepository _foodRepository;

  FoodCategoryCubit(this._foodRepository) : super(FoodCategoryInitial());

  // Временные моковые данные
  static final List<FoodModel> mockFoods = [
    FoodModel(
      id: '1',
      name: 'Куриное филе с рисом',
      description: 'Сочное куриное филе с рисом и грибным соусом',
      price: 2750,
      imageUrl: 'https://example.com/chicken.jpg',
      category: 'Горячие блюда',
    ),
    FoodModel(
      id: '2',
      name: 'Венский завтрак',
      description: 'Глазунья, сардельки',
      price: 3200,
      imageUrl: 'https://example.com/breakfast.jpg',
      category: 'Завтраки',
    ),
  ];

  Future<void> loadFoodsByCategory(String category) async {
    emit(const FoodCategoryLoading());
    try {
      // В реальном приложении здесь будет вызов API
      // final foods = await _foodRepository.getFoodList();
      emit(FoodCategoryLoaded(mockFoods));
    } catch (e) {
      emit(FoodCategoryError(e.toString()));
    }
  }
}
