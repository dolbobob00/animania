import 'package:animania/src/data/models/food_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BigFoodCard extends StatelessWidget {
  const BigFoodCard({super.key, required this.foodModel});
  final FoodModel foodModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      highlightColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      onTap: () {
        context.pushNamed(
          'food_details',
          extra: foodModel,
        );
      },
      child: Card(
        elevation: 4,
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Hero(
                tag: 'food_image_${foodModel.id}',
                child: CachedNetworkImage(
                  imageUrl: foodModel.imageUrl ??
                      'https://www.example.com/default_image.png',
                  fit: BoxFit.cover,
                  height: 80 + MediaQuery.sizeOf(context).height * 0.025,
                  width: 80 + MediaQuery.sizeOf(context).width * 0.025,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                  ),
                ),
              ),
            ),
            Text(
              foodModel.name ?? 'Food Name',
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                foodModel.description ?? 'Food Description',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.ellipsis,
                    height: 0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //! ADD CURENCY
                Text(
                  '\$ ${foodModel.price ?? '0.00'}',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    // Add to cart action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
