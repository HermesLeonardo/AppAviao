part of 'usuario_dto.dart';

mixin UsuarioValidade {
  // Validação para o nome do usuário
  String? nomeValidate(String nome) {
    if (nome.isEmpty) {
      return 'O nome não pode ser vazio';
    }
    return null;
  }

  // Validação para o telefone do usuário
  String? telefoneValidate(String telefone) {
    if (telefone.isEmpty) {
      return 'O telefone não pode ser vazio';
    }
    return null;
  }

  // Validação para o email do usuário
  String? emailValidate(String email) {
    if (email.isEmpty) {
      return 'O email não pode ser vazio';
    } else if (!email.contains('@')) {
      return 'O email deve conter um @';
    }
    return null;
  }

  // Validação para a senha do usuário
  String? senhaValidate(String senha) {
    if (senha.isEmpty) {
      return 'A senha não pode ser vazia';
    } else if (senha.length < 6) {
      return 'A senha deve conter pelo menos 6 caracteres';
    }
    return null;
  }

  // Validação para o modelo da aeronave do usuário
  String? modeloAeronaveValidate(String modeloAeronave) {
    if (modeloAeronave.isEmpty) {
      return 'O modelo da aeronave não pode ser vazio';
    }
    return null;
  }

  // Validação para o código da aeronave do usuário
  String? codigoAeronaveValidate(String codigoAeronave) {
    if (codigoAeronave.isEmpty) {
      return 'O código da aeronave não pode ser vazio';
    }
    return null;
  }
}
