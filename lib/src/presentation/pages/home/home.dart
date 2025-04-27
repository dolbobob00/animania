import 'package:animania/src/configs/app_colors.dart';
import 'package:animania/src/presentation/widgets/appbar/sliver_appbar.dart';
import 'package:animania/src/presentation/widgets/cards/big_food_card.dart';
import 'package:animania/src/presentation/widgets/cards/food_card.dart';
import 'package:animania/src/presentation/widgets/cards/listview_food_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../data/models/banner_model.dart';
import '../../../data/models/food_model.dart';
import '../../cubits/theme_cubit.dart';
import '../../../data/constants.dart';
import '../../widgets/banner/banner.dart';
import '../../widgets/navigation/search_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeof = Theme.of(context);
    final foodList = List.generate(
      8,
      (index) => FoodModel(
        category: 'Food',
        id: index.toString(),
        name: 'Food $index',
        description: 'Description of Food $index',
        imageUrl:
            'https://static.tildacdn.com/tild6330-3538-4965-a164-383631626636/Pancake_Strawberry_B.jpg',
        price: 10.0 + index,
      ),
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MySliverAppBar(),
          SliverAppBar(
            toolbarHeight: 25 + MediaQuery.sizeOf(context).height * 0.015,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: ListviewFoodCategories(),
            ),
          ),
          SliverToBoxAdapter(
            child: CustomBanner(
              banner: BannerModel(
                imageUrl: 'assets/TEMP/banner.png',
                title: 'Order,\nRelax and \nEnjoy with foody!',
                subtitle: 'Your Favourite Meals Just One\nClick Away.',
                id: 1,
                link: 'info',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recommended For You',
                        style: themeof.textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'See More',
                        style: themeof.textTheme.titleMedium!.copyWith(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                mainAxisExtent: 200,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return BigFoodCard(
                  foodModel: foodList[index],
                );
              },
              itemCount: 8,
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Popular things',
                      style: themeof.textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Activate code'),
                    onTap: () {},
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    title: const Text('Support team'),
                    onTap: () {},
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    title: const Text('Send gift card'),
                    onTap: () {},
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
