class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite seu e-mail';
    }
    
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Digite um e-mail válido';
    }
    
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite sua senha';
    }

    if (value.length < 6) {
      return 'A senha deve ter ao menos 6 caracteres';
    }

    return null;
  }
  
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite seu nome';
    }
    
    if (value.trim().split(' ').length < 2) {
      return 'Digite seu nome completo';
    }
    
    return null;
  }
  
  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirme sua senha';
    }
    
    if (value != password) {
      return 'As senhas não coincidem';
    }
    
    return null;
  }
}