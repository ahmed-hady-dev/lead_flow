import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: AppColors.primaryGreen,
    // hintColor: AppColors.primaryGreen,
    highlightColor: AppColors.primaryGreen.withOpacity(0.5),
    canvasColor: AppColors.primaryGreen,
    primaryColorLight: AppColors.primaryGreen,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: AppColors.primaryGreen,
          surfaceContainerHigh: Colors.white,
        ),
    textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Tajawal'),
    primaryTextTheme: ThemeData.light().textTheme.apply(fontFamily: 'Tajawal'),
    appBarTheme: AppBarTheme.of(context).copyWith(backgroundColor: Colors.white),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryGreen),
        borderRadius: BorderRadius.circular(4),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}
