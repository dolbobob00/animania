import 'package:animania/src/configs/app_colors.dart';
import 'package:animania/src/presentation/widgets/cards/food_card.dart';
import 'package:animania/src/presentation/widgets/cards/listview_food_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/theme_cubit.dart';
import '../../../data/constants.dart';
import '../../widgets/banner/banner.dart';
import '../../widgets/navigation/search_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeof = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 91,
            floating: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.23),
                    blurRadius: 15.1,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: FlexibleSpaceBar(
                  background: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        onTap: () {},
                        icon: Icon(
                          Icons.search,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Location',
                              style: themeof.textTheme.bodySmall,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.secondaryGreen,
                                  size: 20,
                                ),
                                Text(
                                  '189 St, Houston, NY',
                                  style: themeof.textTheme.bodyMedium!.copyWith(
                                      color: themeof.colorScheme.background),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 24,
                                  color: themeof.colorScheme.background,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      color: Colors.black.withOpacity(0.25),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      CustomIconButton(
                        onTap: () {},
                        icon: Icon(
                          Icons.person,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: PopupMenuButton<AppThemeType>(
              icon: const Icon(Icons.palette),
              onSelected: (AppThemeType theme) {
                context.read<ThemeCubit>().changeTheme(theme);
              },
              itemBuilder: (context) => AppThemeType.values
                  .map((theme) => PopupMenuItem(
                        value: theme,
                        child: Text(theme.name),
                      ))
                  .toList(),
            ),
          ),
          SliverToBoxAdapter(child: CustomBanner()),
          SliverAppBar(
            pinned: true,
            toolbarHeight: 50 + MediaQuery.sizeOf(context).height * 0.015,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: ListviewFoodCategories(),
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
        ],
      ),
    );
  }
}
