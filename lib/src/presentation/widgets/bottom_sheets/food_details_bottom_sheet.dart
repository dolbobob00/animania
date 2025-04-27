import 'package:flutter/material.dart';
import '../../../configs/app_colors.dart';
import '../../../data/models/food_model.dart';

class FoodDetailsBottomSheet extends StatefulWidget {
  const FoodDetailsBottomSheet({
    super.key,
    required this.food,
  });

  final FoodModel food;

  @override
  State<FoodDetailsBottomSheet> createState() => _FoodDetailsBottomSheetState();
}

class _FoodDetailsBottomSheetState extends State<FoodDetailsBottomSheet> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.eatthis.com%2Fwp-content%2Fuploads%2Fsites%2F4%2F2018%2F06%2Fburger-king-meal-facebook.jpg%3Ffit%3D1024%2C750%26ssl%3D1&f=1&nofb=1&ipt=78399aa70d3cd86925ed2faecc8663f2f81a82c0540b9dbc8387bd173a9b44cb',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.food.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          if (widget.food.discount != null) ...[
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  '${widget.food.price.toStringAsFixed(2)}₽',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${widget.food.finalPrice.toStringAsFixed(2)}₽',
                                  style: TextStyle(
                                    color: AppColors.secondaryGreen,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ] else
                            Text(
                              '${widget.food.price.toStringAsFixed(2)}₽',
                              style: TextStyle(
                                color: AppColors.secondaryGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {
                        // Handle share
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Состав:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.food.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (widget.food.ingredients.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: widget.food.ingredients
                        .map((ingredient) => Chip(label: Text(ingredient)))
                        .toList(),
                  ),
                ],
                const Divider(height: 32),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() => quantity--);
                              }
                            },
                          ),
                          Text(
                            quantity.toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() => quantity++);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: AppColors.secondaryGreen,
                        ),
                        onPressed: widget.food.isAvailable
                            ? () {
                                // Handle add to cart
                                Navigator.pop(context);
                              }
                            : null,
                        child: Text(
                          widget.food.isAvailable
                              ? 'Добавить ${(widget.food.finalPrice * quantity).toStringAsFixed(2)}₽'
                              : 'Недоступно',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
