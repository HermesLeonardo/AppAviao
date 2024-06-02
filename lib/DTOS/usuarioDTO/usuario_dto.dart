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

  // Converte um UsuarioDTO para um Map
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

  // Cria um UsuarioDTO a partir de um Map
  factory UsuarioDTO.fromMap(Map<String, dynamic> map) {
    return UsuarioDTO(
      nome: map['nome'],
      telefone: map['telefone'],
      email: map['email'],
      senha: map['senha'],
      modeloAeronave: map['modeloAeronave'],
      codigoAeronave: map['codigoAeronave'],
    );
  }
}
