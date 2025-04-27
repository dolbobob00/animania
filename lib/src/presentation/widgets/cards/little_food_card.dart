import 'package:flutter/material.dart';

import '../../../configs/app_colors.dart';
import '../../../data/models/food_model.dart';
import '../bottom_sheets/food_details_bottom_sheet.dart';

class LittleFoodCard extends StatelessWidget {
  const LittleFoodCard({super.key, required this.foodModel});
  final FoodModel foodModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => FoodDetailsBottomSheet(
            food: FoodModel(
              id: '1',
              name: 'Burger',
              description: 'Delicious burger with cheese',
              price: 299.99,
              imageUrl: 'url_to_image',
              category: 'Fast Food',
              discount: 15,
              ingredients: ['Beef', 'Cheese', 'Lettuce', 'Tomato'],
            ),
          ),
        );
      },
      child: SizedBox(
        height: 50 + MediaQuery.sizeOf(context).height * 0.05,
        child: Card(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8)),
                      child: Image.network(
                        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.greenqueen.com.hk%2Fwp-content%2Fuploads%2F2021%2F01%2Fburger-king.jpg&f=1&nofb=1&ipt=db8245524263ad7dff75ba939fefb40c18148ca35cd279d8d137ffe09a8486ff',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '3450₽',
                          style: TextStyle(
                            color: AppColors.secondaryGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Food Item Name',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryLightGreen.withAlpha(222),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: IconButton(
                    color: AppColors.secondaryGreen,
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {
                      //! Handle  button press
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
