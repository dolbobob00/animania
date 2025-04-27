import 'package:animania/src/presentation/widgets/banner/is_open_now.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/restaurant_model.dart';
import '../../../configs/app_colors.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      splashColor: AppColors.orangePrimary,
      onTap: () {
        context.pushNamed(
          'restaurantDetails',
          extra: restaurant,
        );
      },
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Image.network(
                    restaurant.imageUrls.first,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        restaurant.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            restaurant.isFavorite ? Colors.red : Colors.white,
                      ),
                      onPressed: () {
                        // Toggle favorite
                      },
                    ),
                  ),
                  if (restaurant.promotions.isNotEmpty)
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FontAwesomeIcons.percent,
                                size: 14,
                                color: Colors.white,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  restaurant.promotions.first.title,
                                  style: theme.textTheme.labelLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  IsOpenNow(
                    closingTime: restaurant.closingTime,
                    openingTime: restaurant.openingTime,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.name,
                            style: theme.textTheme.titleLarge,
                          ),
                          Text(
                            restaurant.slogan,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: AppColors.secondaryGreen,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.delivery_dining,
                        color: AppColors.secondaryGreen,
                      ),
                      Text(
                        '${restaurant.deliveryTimeMinutes} min',
                        style: theme.textTheme.bodyMedium,
                      ),
                      dotSeparator(),
                      Text(
                        '\$' * restaurant.priceLevel,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: AppColors.secondaryGreen,
                        ),
                      ),
                      dotSeparator(),
                      Icon(Icons.face_outlined, color: Colors.green, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        restaurant.rating.toStringAsFixed(1),
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dotSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        width: 4,
        height: 4,
        decoration: BoxDecoration(
          color: AppColors.secondaryGreen,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
