import 'package:atividade4/screens/home/home_screen.dart';
import 'package:atividade4/screens/login/login_screen.dart';
import 'package:atividade4/shared/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Modules/splash_screen.dart';
import 'Modules/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Splash Demo',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      initialRoute: '/',
      routes: {
        '/':
            (context) => const SplashScreen(
              nextRoute: '/onboarding',
              lottiePath: 'assets/animations/splash_animation.json',
            ),
        '/onboarding':
            (context) => const OnboardingScreen(loginRoute: '/login'),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
