import 'package:animania/src/presentation/widgets/appbar/sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../data/models/food_model.dart';

class FoodDetails extends StatelessWidget {
  final FoodModel foodModel;

  const FoodDetails({
    super.key,
    required this.foodModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          const SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          CustomScrollView(
            slivers: [
              MySliverAppBar(),
              SliverToBoxAdapter(
                child: Hero(
                  tag: 'food_image_${foodModel.id}',
                  child: CachedNetworkImage(
                    height: 100,
                    width: 100,
                    imageUrl: foodModel.imageUrl ??
                        'https://www.example.com/default_image.png',
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
                      Text(
                        foodModel.name ?? 'Food Name',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        foodModel.description ?? 'No description available',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '\$${foodModel.price}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
