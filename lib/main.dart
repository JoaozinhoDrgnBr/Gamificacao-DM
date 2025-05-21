import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/home_screen.dart';
import 'screens/onboarding_screen.dart';
import 'utils/constants.dart';
import 'widgets/splash_content.dart';

void main() {
  // Importante para garantir que o binding seja inicializado
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configurar a orientação do app
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Configurar o estilo da barra de status
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gems Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        // Usando o widget personalizado para a splash
        splash: const SplashContent(),
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        backgroundColor: AppColors.primary,
        nextScreen: const OnboardingScreen(),
        // Para uma splash simples, use isto:
        // splash: Image.asset('assets/images/splash_logo.png'),
      ),
    );
  }
}
