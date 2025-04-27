import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../configs/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) {
        if (mounted) {
          // Always go to registration first
          context.goNamed('registration');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeof = Theme.of(context);
    return Scaffold(
      backgroundColor: themeof.colorScheme.primary,
      body: SafeArea(
        child: Center(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/mdi_food.svg',
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 24),
              Text(
                'DeFOOD',
                style: themeof.textTheme.displayLarge?.copyWith(
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 14),
                      blurRadius: 11.3,
                    ),
                  ],
                ),
              ),
              Text(
                'Welcome to Foody!',
                style: themeof.textTheme.titleLarge?.copyWith(
                  color: themeof.colorScheme.background,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 11),
                      blurRadius: 6.3,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80 + MediaQuery.sizeOf(context).height * 0.1,
              ),
              Text(
                'Delicious Delivered.',
                style: themeof.textTheme.titleLarge?.copyWith(
                  fontSize: 24,
                ),
              ),
              Divider(
                color: themeof.colorScheme.background,
                thickness: 2,
                endIndent: MediaQuery.sizeOf(context).width * 0.4,
                indent: MediaQuery.sizeOf(context).width * 0.4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
