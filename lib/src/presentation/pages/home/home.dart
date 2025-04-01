import 'package:animania/src/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/theme_cubit.dart';
import '../../../data/constants.dart';
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/TEMP/banner.png',
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order,\nRelax and \nEnjoy with foody!',
                            style: themeof.textTheme.titleMedium!.copyWith(
                              fontSize: 20,
                              color: themeof.colorScheme.background,
                            ),
                          ),
                          Divider(
                            endIndent: MediaQuery.sizeOf(context).width * 0.6,
                            thickness: 2,
                          ),
                          Text(
                            'Your Favourite Meals Just One\n Click Away.',
                            style: themeof.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
