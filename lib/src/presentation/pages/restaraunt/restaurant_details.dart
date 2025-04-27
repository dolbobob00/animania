import 'package:animania/src/configs/app_colors.dart';
import 'package:animania/src/data/models/restaurant_model.dart';
import 'package:animania/src/presentation/widgets/banner/sale_banner.dart';
import 'package:animania/src/presentation/widgets/cards/little_food_card.dart';
import 'package:animania/src/presentation/widgets/categories/food_category_section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/food_model.dart';
import '../../cubits/restaurant_cubit/cubit/restaurant_details_cubit.dart';

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({super.key, required this.restaurantModel});

  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantDetailsCubit(restaurantModel),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  // restaurantModel.imageUrls.first,
                  'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fthefoodxp.com%2Fwp-content%2Fuploads%2F2023%2F02%2FBurger-King-menu-prices-1024x683.jpg&f=1&nofb=1&ipt=a3271f2dff43b9800c8ba4968f76793823ce76a62b9017de7655eff3bb77131c',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          restaurantModel.name,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.green,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                restaurantModel.rating.toString(),
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          restaurantModel.address ?? 'No address',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Restaurant stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem(
                          Icons.motorcycle,
                          '${restaurantModel.deliveryTimeMinutes} мин',
                          'Delivery Time',
                        ),
                        _buildStatItem(
                          Icons.shopping_basket,
                          'От 1250',
                          'Min Order',
                        ),
                        _buildStatItem(
                          Icons.star_border,
                          restaurantModel.rating.toString(),
                          'Rating',
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Popular',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: restaurantModel.promotions.isNotEmpty
                  ? SaleBanner(promotionModel: restaurantModel.promotions.first)
                  : const SizedBox.shrink(),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _buildFoodItem(context);
                },
                childCount: 4,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: restaurantModel.foodCategories.map((category) => 
                  BlocBuilder<RestaurantDetailsCubit, RestaurantDetailsState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return FoodCategorySection(
                        categoryTitle: category,
                        foods: state.foodsByCategory[category] ?? [],
                      );
                    },
                  ),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.secondaryGreen),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryGreen,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  //! mock
  Widget _buildFoodItem(BuildContext context) {
    return LittleFoodCard(
      foodModel: FoodModel(
        id: '1',
        name: 'Burger',
        description: 'Delicious burger with cheese',
        price: 299.99,
        imageUrl:
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3',
        category: 'Fast Food',
        discount: 15,
        ingredients: ['Beef', 'Cheese', 'Lettuce', 'Tomato'],
      ),
    );
  }
}
