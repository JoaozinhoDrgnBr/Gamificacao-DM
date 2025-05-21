import 'package:flutter/material.dart';
import '../../../shared/services/auth_service.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  /// Valida os campos do formulário de login
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  /// Processo de login utilizando o AuthService
  Future<void> login(BuildContext context) async {
    if (!validateForm()) return;

    final email = emailController.text.trim();
    final password = passwordController.text;

    // Mostrar indicador de carregamento
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // Fazer login usando o serviço de autenticação
      final success = await AuthService.login(
        email: email,
        password: password,
      );

      // Fechar indicador de carregamento
      Navigator.of(context).pop();

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login realizado com sucesso!')),
        );
        await Future.delayed(const Duration(seconds: 1));
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('E-mail ou senha inválidos.')),
        );
      }
    } catch (e) {
      // Fechar indicador de carregamento
      Navigator.of(context).pop();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao fazer login: ${e.toString()}')),
      );
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}