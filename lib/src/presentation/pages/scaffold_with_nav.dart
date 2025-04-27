import 'package:flutter/material.dart';
import '../widgets/geolocation_checker.dart';
import '../widgets/navigation/bottom_nav_bar.dart';

class ScaffoldWithNav extends StatelessWidget {
  final Widget child;
  final int currentIndex;

  const ScaffoldWithNav({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GeolocationChecker(
      child: Scaffold(
        body: child,
        extendBody: true,
        bottomNavigationBar: BottomNavBar(
          currentIndex: currentIndex,
        ),
      ),
    );
  }
}
