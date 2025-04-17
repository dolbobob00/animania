import 'package:flutter/material.dart';

import '../../../configs/app_colors.dart';
import '../navigation/search_button.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key});

  @override
  SliverAppBar build(BuildContext context) {
    final themeof = Theme.of(context);
    return SliverAppBar(
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
    );
  }
}
