import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/constants.dart';
import '../cubits/theme_cubit.dart';

class ThemeChangerButton extends StatelessWidget {
  const ThemeChangerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppThemeType>(
      builder: (context, currentTheme) {
        return DropdownButton<AppThemeType>(
          value: currentTheme,
          icon: const Icon(Icons.palette),
          underline: const SizedBox(),
          items: AppThemeType.values.map((AppThemeType theme) {
            return DropdownMenuItem<AppThemeType>(
              value: theme,
              child: Text(theme.name),
              
            );
          }).toList(),
          onChanged: (AppThemeType? newTheme) {
            if (newTheme != null) {
              context.read<ThemeCubit>().changeTheme(newTheme);
            }
          },
        );
      },
    );
  }
}
