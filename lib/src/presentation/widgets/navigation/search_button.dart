import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  const CustomIconButton({
    super.key,
    required this.onTap, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final themeof = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Stack(
        children: [
          IconButton(
            iconSize: 35,

            onPressed: onTap,
            icon: icon,
            style: IconButton.styleFrom(
              backgroundColor: themeof.colorScheme.background,
              foregroundColor: Colors.black,
            ),
          ),
          Positioned.fill(
            child: ClipOval(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(-0.7, -0.7), //  x=2, y=4
                    end: const Alignment(0.7, 0.7),
                    colors: [
                      Colors.black.withOpacity(0.15),
                      Colors.black.withOpacity(0.05),
                    ],
                    stops: const [0, 0.3], // blur 2.6
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
