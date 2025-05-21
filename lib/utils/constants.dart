import 'package:flutter/material.dart';

/// Classe com as cores do app
class AppColors {
  // Cores principais
  static const Color primary = Color(0xFF4A6CF7);
  static const Color secondary = Color(0xFFFF9800);
  static const Color accent = Color(0xFF00BCD4);
  
  // Cores neutras
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF5F7FA);
  static const Color error = Color(0xFFE53935);
  
  // Escalas de cinza
  static const Color grey100 = Color(0xFFF5F7FA);
  static const Color grey200 = Color(0xFFE4E7EB);
  static const Color grey300 = Color(0xFFCBD2D9);
  static const Color grey400 = Color(0xFF9AA5B1);
  static const Color grey500 = Color(0xFF7B8794);
  static const Color grey600 = Color(0xFF616E7C);
  static const Color grey700 = Color(0xFF3E4C59);
  static const Color grey800 = Color(0xFF1F2933);
}

/// Espaçamentos padrão do app
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

/// Estilos de texto do app
class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: AppColors.grey800,
  );
  
  static const TextStyle headline2 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.grey800,
  );
  
  static const TextStyle headline3 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: AppColors.grey800,
  );
  
  static const TextStyle body1 = TextStyle(
    fontSize: 16.0,
    color: AppColors.grey700,
  );
  
  static const TextStyle body2 = TextStyle(
    fontSize: 14.0,
    color: AppColors.grey600,
  );
  
  static const TextStyle button = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}

/// Strings do app
class AppStrings {
  static const String appName = 'Flutter Gems Demo';
  static const String onboardingTitle = 'Bem-vindo ao Flutter Gems Demo';
  static const String onboardingSubtitle = 'Explorando a praticidade dos Flutter Gems para criar apps incríveis';
  static const String homeTitle = 'Flutter Gems';
  static const String getStarted = 'Começar';
}