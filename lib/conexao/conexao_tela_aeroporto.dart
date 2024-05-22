import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


class conexao_tela_aeroporto {
  static const _dbname = "appaviao.db";
  static const _sqlScript = '''
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

  //singleton
  conexao_tela_aeroporto._privateConstuctor();
  static final conexao_tela_aeroporto instance =
      conexao_tela_aeroporto._privateConstuctor();
  // tem somente uma referência ao banco de dados - com safenull

  static Database? _database;

  Future<Database> get database async {
    return _database ??= await initDB();
  }

  Future<Database> initDB() async {
    databaseFactory = databaseFactoryFfi; //FACTORY TA AQUI
    // instancia o db na primeira vez que for acessado
    return openDatabase(
      join(await getDatabasesPath(), _dbname),
      onCreate: (db, version) async {
        await db.execute(_sqlScript);
      },
      version: 1,
    );
  }

  Future<Database> getDatabase() async {
    // instancia o db na primeira vez que for acessado
    return openDatabase(
      join(await getDatabasesPath(), _dbname),
      onCreate: (db, version) {
        return db.execute(_sqlScript);
      },
      version: 1,
    );
  }
}
