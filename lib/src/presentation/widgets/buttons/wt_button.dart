import 'package:flutter/material.dart';

class WtButton extends StatelessWidget {
  const WtButton(
      {super.key,
      this.title,
      this.onPressed,
      this.backgroundColor,
      this.leading,
      this.titleColor,
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly});
  final String? title;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? titleColor;
  final Widget? leading;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          leading ?? Container(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: titleColor ?? Theme.of(context).colorScheme.background,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
