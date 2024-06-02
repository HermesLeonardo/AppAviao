class Usuario {
  final int? id;
  final String nome;
  final String telefone;
  final String email;
  final String senha;
  final String modeloAeronave;
  final String codigoAeronave;

  Usuario({
    this.id,
    required this.nome,
    required this.telefone,
    required this.email,
    required this.senha,
    required this.modeloAeronave,
    required this.codigoAeronave,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'senha': senha,
      'modeloAeronave': modeloAeronave,
      'codigoAeronave': codigoAeronave,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      telefone: map['telefone'],
      email: map['email'],
      senha: map['senha'],
      modeloAeronave: map['modeloAeronave'],
      codigoAeronave: map['codigoAeronave'],
    );
  }
}
