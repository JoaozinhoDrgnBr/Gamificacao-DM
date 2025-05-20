import 'package:flutter/material.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  /// Valida os campos do formulário de login
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  /// Simula o processo de login (substitua por autenticação real)
  Future<void> login(BuildContext context) async {
    if (!validateForm()) return;

    final email = emailController.text.trim();
    final password = passwordController.text;

    // Simulação de autenticação
    if (email == 'teste@exemplo.com' && password == '123456') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login realizado com sucesso!')),
      );
      await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).pushReplacementNamed('/home');

      // TODO: Navegação para próxima tela
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-mail ou senha inválidos.')),
      );
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
