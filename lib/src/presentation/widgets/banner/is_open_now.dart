import 'package:flutter/material.dart';

class IsOpenNow extends StatelessWidget {
  const IsOpenNow({super.key, this.openingTime, this.closingTime});
  final TimeOfDay? openingTime;
  final TimeOfDay? closingTime;

  bool _isCurrentlyOpen() {
    if (openingTime == null || closingTime == null) return false;

    final now = TimeOfDay.now();
    final currentMinutes = now.hour * 60 + now.minute;
    final openMinutes = openingTime!.hour * 60 + openingTime!.minute;
    final closeMinutes = closingTime!.hour * 60 + closingTime!.minute;

    if (closeMinutes < openMinutes) {
      // Handles cases where closing time is on the next day
      return currentMinutes >= openMinutes || currentMinutes <= closeMinutes;
    } else {
      return currentMinutes >= openMinutes && currentMinutes <= closeMinutes;
    }
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    if (openingTime == null || closingTime == null) return const SizedBox();

    final isOpen = _isCurrentlyOpen();

    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isOpen
              ? Colors.green.withOpacity(0.5)
              : Colors.grey.withOpacity(0.5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          isOpen
              ? 'Open now, until ${_formatTime(closingTime!)}'
              : 'Closed now, opens at ${_formatTime(openingTime!)}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
