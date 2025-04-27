import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../configs/app_colors.dart';
import '../../cubits/geolocation_cubit/cubit/geolocation_cubit.dart';

class NeedGeolocationPage extends StatefulWidget {
  const NeedGeolocationPage({super.key});

  @override
  State<NeedGeolocationPage> createState() => _NeedGeolocationPageState();
}

class _NeedGeolocationPageState extends State<NeedGeolocationPage> {
  @override
  void dispose() {
    // Cancel any pending operations
    super.dispose();
  }

  void _handleLocationEnabled(BuildContext context, GeolocationState state) {
    if (!mounted) return;
    
    if (state.hasPermission && state.isLocationEnabled) {
      Future.microtask(() {
        if (mounted) {
          context.pop();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<GeolocationCubit, GeolocationState>(
        listener: _handleLocationEnabled,
        child: SafeArea(
          child: Center(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 100,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Enable Location Services',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'We need your location to show you nearby restaurants and provide delivery service',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        if (mounted) {
                          context.read<GeolocationCubit>().requestPermission();
                        }
                      },
                      child: const Text('Enable Location'),
                    ),
                    TextButton(
                      onPressed: () {
                        if (mounted) {
                          context.goNamed('home');
                        }
                      },
                      child: const Text('Skip for now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
