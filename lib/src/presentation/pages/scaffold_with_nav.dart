import 'package:flutter/material.dart';
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
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
      ),
      extendBody: true,
    );
  }
}
