import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// Botão personalizado reutilizável do app
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isOutlined;
  final IconData? icon;
  
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.isOutlined = false,
    this.icon,
  });
  
  @override
  Widget build(BuildContext context) {
    // Configuração do estilo do botão
    final buttonStyle = isOutlined
      ? OutlinedButton.styleFrom(
          side: BorderSide(color: backgroundColor ?? AppColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
        )
      : ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: textColor ?? Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
        );
    
    // Se tiver ícone, retorna um botão com ícone e texto
    if (icon != null) {
      return isOutlined
        ? OutlinedButton.icon(
            onPressed: onPressed,
            style: buttonStyle,
            icon: Icon(icon, color: textColor ?? AppColors.primary),
            label: Text(
              text,
              style: AppTextStyles.button.copyWith(
                color: textColor ?? AppColors.primary,
              ),
            ),
          )
        : ElevatedButton.icon(
            onPressed: onPressed,
            style: buttonStyle,
            icon: Icon(icon),
            label: Text(
              text,
              style: AppTextStyles.button,
            ),
          );
    }
    
    // Caso contrário, retorna um botão apenas com texto
    return isOutlined
      ? OutlinedButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: Text(
            text,
            style: AppTextStyles.button.copyWith(
              color: textColor ?? AppColors.primary,
            ),
          ),
        )
      : ElevatedButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: Text(
            text,
            style: AppTextStyles.button,
          ),
        );
  }
}