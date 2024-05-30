import 'package:appaviao/DTOS/trechoDTO/trecho_dto.dart';
import 'package:appaviao/conexao/conexao.dart';
import 'package:sqflite/sqflite.dart';

class trecho_dao {
  // final Database _db;
  Future<Database> get _db async =>
      await conexao.instance.database;

  Future<void> insertTrecho(trecho_dto trechoDto) async {
    final db = await _db;
    await db.insert('trecho', trechoDto.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<trecho_dto>> selecionarTrecho() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query('trecho');

    return List.generate(maps.length, (i) {
      return trecho_dto(
        idtrecho: maps[i]['idtrecho'],
        de_trecho: maps[i]['de_trecho'],
        para_trecho: maps[i]['para_trecho'],
        trecho_trecho: maps[i]['trecho_trecho'],
        proa_trecho: maps[i]['proa_trecho'],
        dist_trecho: maps[i]['dist_trecho'],
        corredor_trecho: maps[i]['corredor_trecho'],
        altCorredor_trecho: maps[i]['altCorredor_trecho'],
        frequencia_trecho: maps[i]['frequencia_trecho'],
        frequenciaAlter_trecho: maps[i]['frequenciaAlter_trecho'],
      );
    });
  }

  Future<void> deleteTrecho(int id) async {
    final db = await _db;
    await db.delete(
      'trecho',
      where: "idtrecho = ?",
      whereArgs: [id],
    );
  }

  Future<void> updateTrecho(trecho_dto trechoDto) async {
    final db = await _db;
    await db.update(
      'trecho',
      trechoDto.toMap(),
      where: "idtrecho = ?",
      whereArgs: [trechoDto.idtrecho],
    );
  }
}
