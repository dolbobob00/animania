import 'package:flutter/material.dart';
import '../../../configs/app_colors.dart';
import '../../../data/models/food_model.dart';
import '../cards/little_food_card.dart';

class FoodCategorySection extends StatelessWidget {
  final String categoryTitle;
  final List<FoodModel> foods;

  const FoodCategorySection({
    super.key,
    required this.categoryTitle,
    required this.foods,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryTitle,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.secondaryGreen,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to category details
                },
                child: Text(
                  'Все >',
                  style: TextStyle(color: AppColors.secondaryGreen),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: foods.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: LittleFoodCard(
                foodModel: foods[index],
              ),
            );
          },
        ),
      ],
    );
  }
}
