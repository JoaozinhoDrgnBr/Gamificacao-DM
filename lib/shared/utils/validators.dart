class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'E-mail inválido';
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
}