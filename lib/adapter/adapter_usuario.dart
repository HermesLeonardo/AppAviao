import 'package:appaviao/DTOS/usuarioDTO/usuario_dto.dart';
import 'package:appaviao/entitites/usuario_entity.dart';

class UsuarioAdapter {
  static Usuario fromDTO(UsuarioDTO dto) {
    return Usuario(
      nome: dto.nome,
      telefone: dto.telefone,
      email: dto.email,
      senha: dto.senha,
      modeloAeronave: dto.modeloAeronave,
      codigoAeronave: dto.codigoAeronave,
    );
  }

  static UsuarioDTO toDTO(Usuario usuario) {
    return UsuarioDTO(
      nome: usuario.nome,
      telefone: usuario.telefone,
      email: usuario.email,
      senha: usuario.senha,
      modeloAeronave: usuario.modeloAeronave,
      codigoAeronave: usuario.codigoAeronave,
    );
  }
}
