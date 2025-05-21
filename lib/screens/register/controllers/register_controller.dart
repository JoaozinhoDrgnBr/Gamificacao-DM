import 'package:flutter/material.dart';
import '../../../shared/services/auth_service.dart';

class RegisterController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  /// Valida os campos do formulário de registro
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  /// Processo de registro utilizando o AuthService
  Future<void> register(BuildContext context) async {
    if (!validateForm()) return;

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    // Mostrar indicador de carregamento
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // Registrar usando o serviço de autenticação
      final success = await AuthService.register(
        name: name,
        email: email,
        password: password,
      );

      // Fechar indicador de carregamento
      Navigator.of(context).pop();

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Conta criada com sucesso!')),
        );
        
        // Fazer login automático após o registro
        await AuthService.login(email: email, password: password);
        
        await Future.delayed(const Duration(seconds: 1));
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Este e-mail já está em uso.')),
        );
      }
    } catch (e) {
      // Fechar indicador de carregamento
      Navigator.of(context).pop();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao criar conta: ${e.toString()}')),
      );
    }
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}