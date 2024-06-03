import 'package:appaviao/DTOS/controleVooDTO/controleVoo_dto.dart';
import 'package:appaviao/conexao/conexao.dart';
import 'package:sqflite/sqflite.dart';

class controleVoo_dao {
  Future<Database> get _db async => await conexao.instance.database;

  Future<void> insertControleVoo(controleVoo_dto controleVooDto) async {
    final db = await _db;
    await db.insert('controleVoo', controleVooDto.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<controleVoo_dto>> selecionarControleVoo() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query('controleVoo');

    return List.generate(maps.length, (i) {
      return controleVoo_dto(
        idcontroleVoo: maps[i]['idcontroleVoo'],
        nomeViagem: maps[i]['nomeViagem'],
        controle: maps[i]['controle'],
        lat: maps[i]['lat'],
        lag: maps[i]['lag'],
        long: maps[i]['long'],
        qmh_local: maps[i]['qmh_local'],
        qmh_destino: maps[i]['qmh_destino'],
        radio: maps[i]['radio'],
        transponder_1: maps[i]['transponder_1'],
        transponder_emergencia: maps[i]['transponder_emergencia'],
        elevacao_local: maps[i]['elevacao_local'],
        elevacao_destino: maps[i]['elevacao_destino'],
        altitude_obrigatorio: maps[i]['altitude_obrigatorio'],
        tempo_voo_estimado: maps[i]['tempo_voo_estimado'],
        alternativo_1: maps[i]['alternativo_1'],
        alternativo_2: maps[i]['alternativo_2'],
      );
    });
  }

  Future<void> deleteControleVoo(int id) async {
    final db = await _db;
    await db.delete(
      'controleVoo',
      where: 'idcontroleVoo = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateControleVoo(controleVoo_dto controleVooDto) async {
    final db = await _db;
    await db.update(
      'controleVoo',
      controleVooDto.toMap(),
      where: "idcontroleVoo = ?",
      whereArgs: [controleVooDto.idcontroleVoo],
    );
  }
}
