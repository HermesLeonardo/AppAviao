import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class conexao {
  static const _dbname = "appaviao.db";

  static const _sqlScriptaeroporto = '''
  CREATE TABLE IF NOT EXISTS aeroporto (
  idaeroporto INTEGER PRIMARY KEY AUTOINCREMENT,
  codigo_aero TEXT NOT NULL,
  nome_aero TEXT NOT NULL,
  twr_aero TEXT NOT NULL,
  solo_aero TEXT NOT NULL,
  cabeceira_aero TEXT NOT NULL,
  fir_aero TEXT NOT NULL,
  metragem_pista TEXT NOT NULL,
  patio_aero TEXT NOT NULL
  )''';

  static const table = 'aeroporto';

  static const columnId = 'idaeroporto';
  static const columnCodigo = 'codigo_aero';
  static const columnNome = 'nome_aero';
  static const columnTwr = 'twr_aero';
  static const columnSolo = 'solo_aero';
  static const columnCabeceira = 'cabeceira_aero';
  static const columnFir = 'fir_aero';
  static const columnMetragemPista = 'metragem_pista';
  static const columnPatio = 'patio_aero';

  static const _sqlScriptControle = '''
  CREATE TABLE IF NOT EXISTS plano_voo_controle (
  id_plano_voo INTEGER PRIMARY KEY AUTOINCREMENT,
  data_viagem TEXT NOT NULL,
  controle TEXT NOT NULL,
  lat TEXT NOT NULL,
  lag TEXT NOT NULL,
  long TEXT NOT NULL,
  qmh_local TEXT,
  qmh_destino TEXT,
  radio TEXT,
  transponder1 TEXT NOT NULL,
  transponder_emergencia TEXT NOT NULL,
  elevacao_local TEXT NOT NULL,
  elevacao_destino TEXT NOT NULL,
  altitude_obrigatoria TEXT NOT NULL,
  tempo_voo_estimado TEXT,
  alternativo1 TEXT,
  alternativo2 TEXT
  )''';

  static const tableControle = 'plano_voo_controle';

  static const columnIdPlanoVoo = 'id_plano_voo';
  static const columnDataViagem = 'data_viagem';
  static const columnControle = 'controle';
  static const columnLat = 'lat';
  static const columnLag = 'lag';
  static const columnLong = 'long';
  static const columnQmhLocal = 'qmh_local';
  static const columnQmhDestino = 'qmh_destino';
  static const columnRadio = 'radio';
  static const columnTransponder1 = 'transponder1';
  static const columnTransponderEmergencia = 'transponder_emergencia';
  static const columnElevacaoLocal = 'elevacao_local';
  static const columnElevacaoDestino = 'elevacao_destino';
  static const columnAltitudeObrigatoria = 'altitude_obrigatoria';
  static const columnTempoVooEstimado = 'tempo_voo_estimado';
  static const columnAlternativo1 = 'alternativo1';
  static const columnAlternativo2 = 'alternativo2';

  static const _sqlScriptUsuarios = '''
  CREATE TABLE IF NOT EXISTS usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT NOT NULL,
    email TEXT NOT NULL,
    senha TEXT NOT NULL,
    modeloAeronave TEXT NOT NULL,
    codigoAeronave TEXT NOT NULL
  )''';

  // Singleton
  conexao._privateConstuctor();
  static final conexao instance = conexao._privateConstuctor();

  static Database? _database;

  Future<Database> get database async {
    return _database ??= await initDB();
  }

  Future<Database> initDB() async {
    databaseFactory = databaseFactoryFfi;
    return openDatabase(
      join(await getDatabasesPath(), _dbname),
      onCreate: (db, version) async {
        await db.execute(_sqlScriptaeroporto);
        await db.execute(_sqlScriptControle);
        await db.execute(_sqlScriptUsuarios);
      },
      version: 1,
    );
  }

  Future<void> inserirUsuario(Map<String, dynamic> usuario) async {
    final db = await database;
    await db.insert('usuarios', usuario);
  }

  Future<List<Map<String, dynamic>>> listarUsuarios() async {
    final db = await database;
    return db.query('usuarios');
  }

  Future<void> atualizarUsuario(Map<String, dynamic> usuario) async {
    final db = await database;
    await db.update(
      'usuarios',
      usuario,
      where: 'id = ?',
      whereArgs: [usuario['id']],
    );
  }

  Future<void> deletarUsuario(int id) async {
    final db = await database;
    await db.delete(
      'usuarios',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
  /*
  Future<Database> getDatabase() async {
    // instancia o db na primeira vez que for acessado
    return openDatabase(
      join(await getDatabasesPath(), _dbname),
      onCreate: (db, version) async {
        return db.execute(_sqlScriptaeroporto);
        return db.execute(_sqlScriptcontrole);
      },
      version: 1,
    );
  }
  */
