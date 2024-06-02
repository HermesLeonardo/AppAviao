import 'package:appaviao/conexao/conexao.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/DTOS/usuarioDTO/usuario_dto.dart';

class VisualizarDadosUsuario extends StatelessWidget {
  const VisualizarDadosUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados do Usuário'),
      ),
      body: FutureBuilder<UsuarioDTO?>(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            UsuarioDTO? usuario = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome: ${usuario!.nome}'),
                  Text('Telefone: ${usuario.telefone}'),
                  Text('Email: ${usuario.email}'),
                  Text('Modelo da Aeronave: ${usuario.modeloAeronave}'),
                  Text('Código da Aeronave: ${usuario.codigoAeronave}'),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Nenhum dado encontrado.'));
          }
        },
      ),
    );
  }

  Future<UsuarioDTO?> _getUserData() async {
    try {
      final db = await conexao.instance.database;
      List<Map<String, dynamic>> result = await db.query('usuarios');
      if (result.isNotEmpty) {
        return UsuarioDTO(
          nome: result[0]['nome'],
          telefone: result[0]['telefone'],
          email: result[0]['email'],
          senha: result[0]['senha'],
          modeloAeronave: result[0]['modeloAeronave'],
          codigoAeronave: result[0]['codigoAeronave'],
        );
      } else {
        return null;
      }
    } catch (e) {
      print('Erro ao obter dados do usuário: $e');
      return null;
    }
  }
}
