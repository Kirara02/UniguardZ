import 'package:flutter/material.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: "Poppins",
    colorScheme: ColorScheme.light(
      primaryContainer: Colors.blue,
      secondaryContainer: Colors.grey,
      inversePrimary: const Color.fromARGB(255, 123, 122, 122),
      primary: const Color.fromARGB(255, 233, 231, 231),
      secondary: AppColors.secondarySoft,
      tertiary: AppColors.secondaryExtraSoft,
      tertiaryContainer: const Color.fromARGB(255, 80, 97, 212),
      surface: AppColors.light,
      surfaceBright: Colors.white,
    ),
    iconTheme: IconThemeData(color: AppColors.dark),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: AppColors.dark),
      displayMedium: TextStyle(color: AppColors.dark),
      displaySmall: TextStyle(color: AppColors.dark),
      headlineLarge: TextStyle(color: AppColors.dark),
      headlineMedium: TextStyle(color: AppColors.dark),
      headlineSmall: TextStyle(color: AppColors.dark),
      titleLarge: TextStyle(color: AppColors.dark),
      titleMedium: TextStyle(color: AppColors.dark),
      titleSmall: TextStyle(color: AppColors.dark),
      bodyLarge: TextStyle(color: AppColors.dark),
      bodyMedium: TextStyle(color: AppColors.dark),
      bodySmall: TextStyle(color: AppColors.dark),
      labelLarge: TextStyle(color: AppColors.dark),
      labelMedium: TextStyle(color: AppColors.dark),
      labelSmall: TextStyle(color: AppColors.dark),
    ),
    brightness: Brightness.light,
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.light,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: "Poppins",
    colorScheme: ColorScheme.dark(
      primaryContainer: AppColors.dark,
      secondaryContainer: Colors.grey,
      inversePrimary: const Color.fromARGB(255, 199, 197, 197),
      primary: AppColors.primary,
      secondary: AppColors.primarySoft,
      tertiary: AppColors.primaryExtraSoft,
      tertiaryContainer: const Color.fromARGB(255, 38, 28, 28),
      surface: AppColors.dark,
      surfaceBright: Colors.black,
    ),
    iconTheme: IconThemeData(color: AppColors.light),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: AppColors.light),
      displayMedium: TextStyle(color: AppColors.light),
      displaySmall: TextStyle(color: AppColors.light),
      headlineLarge: TextStyle(color: AppColors.light),
      headlineMedium: TextStyle(color: AppColors.light),
      headlineSmall: TextStyle(color: AppColors.light),
      titleLarge: TextStyle(color: AppColors.light),
      titleMedium: TextStyle(color: AppColors.light),
      titleSmall: TextStyle(color: AppColors.light),
      bodyLarge: TextStyle(color: AppColors.light),
      bodyMedium: TextStyle(color: AppColors.light),
      bodySmall: TextStyle(color: AppColors.light),
      labelLarge: TextStyle(color: AppColors.light),
      labelMedium: TextStyle(color: AppColors.light),
      labelSmall: TextStyle(color: AppColors.light),
    ),
    canvasColor: AppColors.dark,
    brightness: Brightness.dark,
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.light,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );

}
