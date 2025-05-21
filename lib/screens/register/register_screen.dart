import 'package:atividade4/shared/constants/constants.dart';
import 'package:atividade4/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../login/widgets/login_text_form_field.dart';
import '../../shared/utils/validators.dart';
import 'controllers/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with SingleTickerProviderStateMixin {
  final controller = RegisterController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
    
    _animationController.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    _animationController.dispose();
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
            color: AppColors.primary, // Cor principal para a faixa
            child: Center(
              // Centraliza o título dentro da faixa
              child: const Text(
                'Registrar',
                style: TextStyle(
                  fontSize: 32, // Tamanho do título
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Cor branca para o texto
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        LoginTextFormField(
                          controller: controller.nameController,
                          hintText: 'Nome completo',
                          icon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Digite seu nome';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        LoginTextFormField(
                          controller: controller.emailController,
                          hintText: 'E-mail',
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
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
                        const SizedBox(height: 16),
                        LoginTextFormField(
                          controller: controller.confirmPasswordController,
                          hintText: 'Confirmar senha',
                          icon: Icons.lock_clock,
                          obscureText: true,
                          validator: (value) {
                            if (value != controller.passwordController.text) {
                              return 'As senhas não coincidem';
                            }
                            return Validators.password(value);
                          },
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          onPressed: () => controller.register(context),
                          text: 'Criar conta',
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Já possui uma conta?'),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed('/login');
                              },
                              child: const Text('Fazer login'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}