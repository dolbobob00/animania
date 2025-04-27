import 'package:animania/src/configs/app_colors.dart';
import 'package:animania/src/presentation/cubits/restaurant_list_cubit/cubit/restaurant_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/appbar/second_sliver_appbar.dart';
import '../../widgets/cards/restaurant_card.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RestaurantListCubit, RestaurantListState>(
        builder: (context, state) {
          if (state is RestaurantListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RestaurantListLoaded) {
            final restaurants = state.restaurants;
            return CustomScrollView(
              slivers: [
                MySliverAppBarSecond(),
                SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 40,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0,
                  title: Text(
                    state.category ?? 'All Restaurants',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: AppColors.secondaryGreen,
                        ),
                  ),
                  centerTitle: false,
                ),
                SliverList(
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
                ),
                SliverFillRemaining(
                  child: Center(
                    child: Text(
                      'No more restaurants available',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            );
          } else if (state is RestaurantListError) {
            return Center(
              child: Text(state.error ?? 'Error loading restaurants'),
            );
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}
