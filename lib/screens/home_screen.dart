import 'package:flutter/material.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.homeTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Flutter Gems Utilizados',
              style: AppTextStyles.headline2,
            ),
            
            const SizedBox(height: AppSpacing.lg),
            
            // Lista de gems usados
            _buildGemCard(
              title: 'flutter_native_splash',
              description: 'Gera automaticamente uma splash screen nativa para iOS, Android e Web.',
              icon: Icons.water_drop_outlined,
            ),
            
            const SizedBox(height: AppSpacing.md),
            
            _buildGemCard(
              title: 'go_router',
              description: 'Sistema de navegação declarativo e simples para Flutter.',
              icon: Icons.route,
            ),
            
            const SizedBox(height: AppSpacing.md),
            
            _buildGemCard(
              title: 'google_fonts',
              description: 'Pacote para utilizar facilmente as fontes do Google no Flutter.',
              icon: Icons.font_download,
            ),
          ],
        ),
      ),
    );
  }
  
  // Widget para exibir informações sobre um gem
  Widget _buildGemCard({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          
          const SizedBox(width: AppSpacing.md),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.headline3,
                ),
                
                const SizedBox(height: AppSpacing.xs),
                
                Text(
                  description,
                  style: AppTextStyles.body2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}