import 'package:flutter/material.dart';

import '../buttons/custom_button.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final themeof = Theme.of(context);
    return Padding(
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
                      height: 0.9,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CustomButton(
                      onPressed: () {},
                      height: 25,
                      text: 'Order Now',
                      prefix: Icon(Icons.shopping_cart),
                      width: MediaQuery.sizeOf(context).width * 0.4,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
