import 'package:animania/src/presentation/cubits/restaurant_list_cubit/cubit/restaurant_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/app_colors.dart';
import '../../widgets/appbar/second_sliver_appbar.dart';
import '../../widgets/cards/listview_food_categories.dart';
import '../../widgets/cards/restaurant_card.dart';

class Restaurants extends StatelessWidget {
  const Restaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MySliverAppBarSecond(),
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 40,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            title: Text(
              'Categories',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppColors.secondaryGreen,
                  ),
            ),
            centerTitle: false,
          ),
          SliverAppBar(
            toolbarHeight: 25 + MediaQuery.sizeOf(context).height * 0.015,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: ListviewFoodCategories(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'All restaurants',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          BlocBuilder<RestaurantListCubit, RestaurantListState>(
            builder: (context, state) {
              if (state is RestaurantListLoaded) {
                final restaurants = state.restaurants;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final restaurant = restaurants[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 8.0,
                        ),
                        child: RestaurantCard(
                          restaurant: restaurant,
                        ),
                      );
                    },
                    childCount: restaurants.length,
                  ),
                );
              }
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
