import 'package:flutter/material.dart';

import 'food_card.dart';

class ListviewFoodCategories extends StatelessWidget {
  const ListviewFoodCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        FoodCard(
          imageUrl:
              'http://images.media-allrecipes.com/userphotos/960x960/6539094.jpg',
          name: 'Veg',
          onTap: () {},
        ),
        FoodCard(
          imageUrl:
              'https://i.pinimg.com/originals/20/92/48/2092483fde63dc2c9e3f2a0038c8af1f.jpg',
          name: 'Non-Veg',
          onTap: () {},
        ),
        FoodCard(
          imageUrl:
              'https://static.vecteezy.com/system/resources/previews/030/683/548/non_2x/burgers-high-quality-4k-hdr-free-photo.jpg',
          name: 'Fast Food',
          onTap: () {},
        ),
        FoodCard(
          imageUrl:
              'https://thumbs.dreamstime.com/b/colourful-coctail-blue-background-26757928.jpg',
          name: 'Drinks',
          onTap: () {},
        ),
        FoodCard(
          imageUrl:
              'http://images.media-allrecipes.com/userphotos/960x960/6539094.jpg',
          name: 'Veg',
          onTap: () {},
        ),
        FoodCard(
          imageUrl:
              'https://i.pinimg.com/originals/20/92/48/2092483fde63dc2c9e3f2a0038c8af1f.jpg',
          name: 'Non-Veg',
          onTap: () {},
        ),
        FoodCard(
          imageUrl:
              'https://static.vecteezy.com/system/resources/previews/030/683/548/non_2x/burgers-high-quality-4k-hdr-free-photo.jpg',
          name: 'Fast Food',
          onTap: () {},
        ),
        FoodCard(
          imageUrl:
              'https://thumbs.dreamstime.com/b/colourful-coctail-blue-background-26757928.jpg',
          name: 'Drinks',
          onTap: () {},
        ),
      ],
    );
  }
}
