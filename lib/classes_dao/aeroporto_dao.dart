import 'package:appaviao/DTOS/aeroportoDTO/aeroporto_dto.dart';
import 'package:appaviao/conexao/conexao_tela_aeroporto.dart';
import 'package:sqflite/sqflite.dart';

class aeroporto_dao {
  // final Database _db;
  Future<Database> get _db async =>
      await conexao_tela_aeroporto.instance.database;

  Future<void> insertAeroporto(aeroporto_dto aeroportoDto) async {
    final db = await _db;
    await db.insert('aeroporto', aeroportoDto.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<aeroporto_dto>> selecionarAeroporto() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query('aeroporto');

    return List.generate(maps.length, (i) {
      return aeroporto_dto(
        idaeroporto: maps[i]['idaeroporto'],
        nome_aero: maps[i]['nome_aero'],
        codigo_aero: maps[i]['codigo_aero'],
        twr_aero: maps[i]['twr_aero'],
        solo_aero: maps[i]['solo_aero'],
        cabeceira_aero: maps[i]['cabeceira_aero'],
        fir_aero: maps[i]['fir_aero'],
        metragem_pista: maps[i]['metragem_pista'],
        patio_aero: maps[i]['patio_aero'],
      );
    });
  }

  Future<void> deleteAeroporto(int id) async {
    final db = await _db;
    await db.delete(
      'aeroporto',
      where: "idaeroporto = ?",
      whereArgs: [id],
    );
  }

  Future<void> updateAeroporto(aeroporto_dto aeroportoDto) async {
    final db = await _db;
    await db.update(
      'aeroporto',
      aeroportoDto.toMap(),
      where: "idaeroporto = ?",
      whereArgs: [aeroportoDto.idaeroporto],
    );
  }
}
