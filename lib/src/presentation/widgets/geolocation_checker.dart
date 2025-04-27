import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/geolocation_cubit/cubit/geolocation_cubit.dart';
import '../pages/geolocation/need_geolocation.dart';

class GeolocationChecker extends StatefulWidget {
  const GeolocationChecker({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<GeolocationChecker> createState() => _GeolocationCheckerState();
}

class _GeolocationCheckerState extends State<GeolocationChecker> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
