import 'package:atividade4/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'controllers/login_controller.dart';
import 'widgets/login_text_form_field.dart';
import '../../shared/utils/validators.dart';
import '../../shared/constants/constants.dart'; // Certifique-se de importar para acessar AppColors

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = LoginController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Faixa acima do título
          Container(
            height: 100, // Altura da faixa
            color: AppColors.primary, // Cor marrom para a faixa
            child: Center(
              // Centraliza o título dentro da faixa
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 32, // Tamanho do título
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Cor branca para o texto
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 8),
            child: Text(
              'Dica: login teste@exemplo.com | senha 123456',
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(child: SizedBox(height: double.infinity)),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LoginTextFormField(
                      controller: controller.emailController,
                      hintText: 'E-mail',
                      icon: Icons.email,
                      validator: Validators.email,
                    ),
                    const SizedBox(height: 16),
                    LoginTextFormField(
                      controller: controller.passwordController,
                      hintText: 'Senha',
                      icon: Icons.lock,
                      obscureText: true,
                      validator: Validators.password,
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      onPressed: () => controller.login(context),
                      text: 'Entrar',
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        // TODO: ação de registro
                      },
                      child: const Text('Registrar-se'),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: ação de recuperação de senha
                      },
                      child: const Text('Esqueci minha senha'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: SizedBox(height: double.infinity)),
        ],
      ),
    );
  }
}
