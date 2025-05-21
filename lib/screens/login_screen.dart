import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import '../utils/constants.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // Simulação de login (retorna null se bem-sucedido ou uma mensagem de erro)
  Future<String?> _authUser(LoginData data) {
    // Simulação de verificação de credenciais com um pequeno delay para dar impressão de processamento
    return Future.delayed(const Duration(milliseconds: 1500), () {
      // Para demonstração, aceitamos qualquer email com '@' e senha com pelo menos 6 caracteres
      if (!data.name.contains('@')) {
        return 'Email inválido';
      }
      
      if (data.password.length < 6) {
        return 'Senha deve ter pelo menos 6 caracteres';
      }
      
      return null; // Sucesso
    });
  }

  // Simulação de cadastro
  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(const Duration(milliseconds: 1500), () {
      // Para demonstração, fazemos uma validação simples
      if (data.name == null || !data.name!.contains('@')) {
        return 'Email inválido';
      }
      
      if (data.password == null || data.password!.length < 6) {
        return 'Senha deve ter pelo menos 6 caracteres';
      }
      
      return null; // Sucesso no cadastro
    });
  }

  // Simulação de recuperação de senha
  Future<String?> _recoverPassword(String email) {
    return Future.delayed(const Duration(milliseconds: 1500), () {
      if (!email.contains('@')) {
        return 'Email inválido';
      }
      
      // Simula envio de email de recuperação
      return null; // Sucesso ao enviar email
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      // Configuração visual para combinar com o tema do app
      title: AppStrings.appName,
      logo: const AssetImage('assets/images/splash_logo.png'),
      theme: LoginTheme(
        primaryColor: AppColors.primary,
        accentColor: AppColors.secondary,
        errorColor: AppColors.error,
        titleStyle: AppTextStyles.headline1.copyWith(color: Colors.white),
        bodyStyle: AppTextStyles.body1,
        textFieldStyle: AppTextStyles.body1,
        buttonStyle: AppTextStyles.button,
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 5,
          margin: const EdgeInsets.only(top: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: const EdgeInsets.all(AppSpacing.md),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        buttonTheme: LoginButtonTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: AppColors.primary,
          elevation: 0,
        ),
      ),
      
      // Textos personalizados
      messages: LoginMessages(
        userHint: 'Email',
        passwordHint: 'Senha',
        confirmPasswordHint: 'Confirmar senha',
        loginButton: 'ENTRAR',
        signupButton: 'CADASTRAR',
        forgotPasswordButton: 'Esqueceu a senha?',
        recoverPasswordButton: 'RECUPERAR',
        goBackButton: 'VOLTAR',
        confirmPasswordError: 'As senhas não coincidem',
        recoverPasswordDescription: 'Enviaremos instruções para recuperar sua senha',
        recoverPasswordSuccess: 'Email de recuperação enviado com sucesso',
      ),
      
      // Callbacks para as funções de autenticação
      onLogin: _authUser,
      onSignup: _signupUser,
      onRecoverPassword: _recoverPassword,
      
      // Após o login bem-sucedido, navegue para a tela inicial
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
      
      // Ocultar o botão de redes sociais que vem por padrão
      hideProvidersTitle: true,
      hideForgotPasswordButton: false,
    );
  }
}