import 'package:animania/src/presentation/cubits/geolocation_cubit/cubit/geolocation_cubit.dart';
import 'package:animania/src/presentation/widgets/buttons/wt_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeolocationRequirement extends StatelessWidget {
  const GeolocationRequirement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Icon(
                    Icons.location_on,
                    size: 100,
                    color: Colors.grey,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 18.0, left: 18, right: 18),
                      child: Text(
                        'Animation placeholder',
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                      ),
                    ),
                  ),
                  Text('Let us know where are you located',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                            color: Theme.of(context).colorScheme.surface,
                          )),
                  const SizedBox(height: 20),
                  Text(
                    'Share your location or import handly your address of delivery below, to find best places near you',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.7),
                        ),
                  ), const SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WtButton(
                      title: 'Share location',
                      onPressed: () {
                        context.read<GeolocationCubit>().getCurrentLocation();
                      },
                    mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WtButton(
                      mainAxisAlignment: MainAxisAlignment.center,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      title: 'Import address',
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
