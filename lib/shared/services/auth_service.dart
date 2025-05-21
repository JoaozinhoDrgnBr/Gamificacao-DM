import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Chaves para armazenamento de dados
  static const String _userEmailKey = 'user_email';
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _registeredUsersKey = 'registered_users_';

  // Verifica se o usuário está logado
  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Registra um novo usuário
  static Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      
      // Verificar se o email já foi registrado
      final userKey = '$_registeredUsersKey$email';
      final userExists = prefs.containsKey(userKey);
      
      if (userExists) {
        return false; // Email já registrado
      }
      
      // Salvar os dados do usuário
      final userData = {
        'name': name,
        'email': email,
        'password': password,
      };
      
      // Simular armazenamento como JSON (na vida real, você usaria um método seguro)
      await prefs.setString(userKey, userData.toString());
      
      return true;
    } catch (e) {
      debugPrint('Erro ao registrar usuário: $e');
      return false;
    }
  }

  // Efetua login
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      // Em um app real, você faria a validação com seu backend
      
      // Simulação: credenciais hardcoded
      if (email == 'teste@exemplo.com' && password == '123456') {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(_userEmailKey, email);
        await prefs.setBool(_isLoggedInKey, true);
        return true;
      }
      
      // Verificar usuários registrados
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final userKey = '$_registeredUsersKey$email';
      
      // Verificar se o usuário existe e a senha está correta
      // Nota: Esta é uma implementação de exemplo simplificada
      // Em produção, você usaria métodos seguros de autenticação
      final userDataStr = prefs.getString(userKey);
      if (userDataStr != null && userDataStr.contains(password)) {
        await prefs.setString(_userEmailKey, email);
        await prefs.setBool(_isLoggedInKey, true);
        return true;
      }
      
      return false;
    } catch (e) {
      debugPrint('Erro ao fazer login: $e');
      return false;
    }
  }

  // Efetua logout
  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, false);
    await prefs.remove(_userEmailKey);
  }

  // Recupera o email do usuário atual
  static Future<String?> getCurrentUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmailKey);
  }

  // Simula envio de e-mail para recuperação de senha
  static Future<bool> sendPasswordResetEmail(String email) async {
    // Aqui você implementaria o envio real de e-mail
    // Retorna true simulando que o e-mail foi enviado com sucesso
    return true;
  }
}