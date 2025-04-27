import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MySliverAppBarSecond extends StatelessWidget {
  const MySliverAppBarSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      leadingWidth: 100,
      leading: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              try {
                context.pop();
              } catch (e) {}
            },
          ),
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
              // Handle geolocation button press
            },
          ),
        ],
      ),
      title: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ваше текущее местоположение',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  'Loading...', // Replace with actual location
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.map),
          onPressed: () {
            // Handle map button press
          },
        ),
      ],
    );
  }
}
