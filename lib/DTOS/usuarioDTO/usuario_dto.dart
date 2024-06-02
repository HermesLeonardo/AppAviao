class UsuarioDTO {
  String nome;
  String telefone;
  String email;
  String senha;
  String modeloAeronave;
  String codigoAeronave;

  UsuarioDTO({
    required this.nome,
    required this.telefone,
    required this.email,
    required this.senha,
    required this.modeloAeronave,
    required this.codigoAeronave,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'senha': senha,
      'modeloAeronave': modeloAeronave,
      'codigoAeronave': codigoAeronave,
    };
  }
}
