import 'package:atividade4/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.backgroundDark,
      onPrimary: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textDark),
      bodyMedium: TextStyle(color: AppColors.textDark),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      iconTheme: IconThemeData(color: AppColors.textDark),
      titleTextStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonDark,
        foregroundColor: AppColors.textDark,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.cardDark,
      shadowColor: AppColors.backgroundDark,
      elevation: 4,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      labelStyle: TextStyle(color: AppColors.textDark),
      floatingLabelStyle: TextStyle(color: AppColors.textDark),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor:
          AppColors.textDark, // Cor do cursor// Cor do "pino" de seleção
    ),
  );
}
