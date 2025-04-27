import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../configs/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Container(
          height: 55.3,
          width: 277.2,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, -2.1),
                blurRadius: 7.49,
                spreadRadius: 0.7,
                blurStyle: BlurStyle.inner,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 2.8),
                blurRadius: 2.8,
              ),
            ],
          ),
          child: NavigationBar(
            height: 55.3,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedIndex: currentIndex,
            indicatorColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            onDestinationSelected: (index) {
              switch (index) {
                case 0:
                  context.goNamed('home');
                  break;
                case 1:
                  context.goNamed('restaurantsFull');
                  break;
                case 2:
                  context.goNamed('search');
                  break;
                case 3:
                  context.goNamed('info');
                  break;
                case 4:
                  context.goNamed('profile');
                  break;
              }
            },
            destinations: [
              _buildNavDestination(Icons.home_outlined, Icons.home, 0),
              _buildNavDestination(Icons.restaurant_outlined, Icons.restaurant, 1),
              _buildNavDestination(Icons.search_outlined, Icons.search, 2),
              _buildNavDestination(Icons.info_outline, Icons.info, 3),
              _buildNavDestination(Icons.person_outline, Icons.person, 4),
            ],
          ),
        ),
      ),
    );
  }

  NavigationDestination _buildNavDestination(
    IconData icon,
    IconData selectedIcon,
    int index,
  ) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: currentIndex == index ? AppColors.secondaryGreen : null,
      ),
      selectedIcon: Icon(
        selectedIcon,
        color: AppColors.secondaryGreen,
      ),
      label: '', // Empty label but required by NavigationDestination
    );
  }
}
