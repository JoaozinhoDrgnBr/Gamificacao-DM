import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/custom_button.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              
              // Logo central
              Center(
                child: Image.asset(
                  'assets/images/splash_logo.png',
                  height: 120,
                ),
              ),
              
              const SizedBox(height: AppSpacing.xl),
              
              // Título
              Text(
                AppStrings.onboardingTitle,
                style: AppTextStyles.headline1,
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: AppSpacing.md),
              
              // Subtítulo
              Text(
                AppStrings.onboardingSubtitle,
                style: AppTextStyles.body1,
                textAlign: TextAlign.center,
              ),
              
              const Spacer(),
              
              // Botão de ação (atualizado para ir para a tela de login)
              CustomButton(
                text: AppStrings.getStarted,
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                ),
                icon: Icons.arrow_forward,
              ),
            ],
          ),
        ),
      ),
    );
  }
}