import 'package:appaviao/conexao/conexao.dart';
import 'package:appaviao/entitites/usuario_entity.dart';

class UsuarioDAO {
  Future<void> inserirUsuario(Usuario usuario) async {
    final db = await conexao.instance.database;
    await db.insert('usuarios', usuario.toMap());
  }

  Future<List<Usuario>> listarUsuarios() async {
    final db = await conexao.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('usuarios');

    return List.generate(maps.length, (i) {
      return Usuario.fromMap(maps[i]);
    });
  }

  Future<void> atualizarUsuario(Usuario usuario) async {
    final db = await conexao.instance.database;
    await db.update(
      'usuarios',
      usuario.toMap(),
      where: 'id = ?',
      whereArgs: [usuario.id],
    );
  }

  Future<void> deletarUsuario(int id) async {
    final db = await conexao.instance.database;
    await db.delete(
      'usuarios',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
