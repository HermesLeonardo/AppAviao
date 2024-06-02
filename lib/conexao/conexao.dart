import 'package:flutter/material.dart';
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

  static const _sqlScriptControle = '''
  CREATE TABLE IF NOT EXISTS controleVoo (
    id_plano_voo INTEGER PRIMARY KEY AUTOINCREMENT,
    nomeViagem TEXT NOT NULL,
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

  static const _sqlScriptTrecho = '''
  CREATE TABLE IF NOT EXISTS trecho (
    idtrecho INTEGER PRIMARY KEY AUTOINCREMENT,
    de_trecho TEXT NOT NULL,
    para_trecho TEXT NOT NULL,
    trecho_trecho TEXT NOT NULL,
    proa_trecho TEXT NOT NULL,
    dist_trecho TEXT NOT NULL,
    corredor_trecho TEXT NOT NULL,
    altCorredor_trecho TEXT NOT NULL,
    frequencia_trecho TEXT NOT NULL,
    frequenciaAlter_trecho TEXT NOT NULL
  )''';

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
    sqfliteFfiInit(); // Inicializa o ffi
    databaseFactory = databaseFactoryFfi; // Define a fábrica para o FFI
    final path = join(await getDatabasesPath(), _dbname);

    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(_sqlScriptaeroporto);
        await db.execute(_sqlScriptControle);
        await db.execute(_sqlScriptUsuarios);
        await db.execute(_sqlScriptTrecho);
        print('Tabelas criadas com sucesso!');
      },
      version: 1, // Atualize a versão do banco de dados
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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Testando Banco de Dados"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              var db = await conexao.instance.database;
              print("Banco de dados inicializado: $db");

              // Teste para verificar se a tabela 'trecho' foi criada
              try {
                List<Map<String, dynamic>> result = await db.query('trecho');
                print(
                    "Tabela 'trecho' existe e contém ${result.length} registros.");
              } catch (e) {
                print("Erro ao acessar a tabela 'trecho': $e");
              }
              try {
                List<Map<String, dynamic>> result = await db.query('aeroporto');
                print(
                    "Tabela 'aeroporto' existe e contém ${result.length} registros.");
              } catch (e) {
                print("Erro ao acessar a tabela 'aeroporto': $e");
              }
              try {
                List<Map<String, dynamic>> result =
                    await db.query('controleVoo');
                print(
                    "Tabela 'controleVoo' existe e contém ${result.length} registros.");
              } catch (e) {
                print("Erro ao acessar a tabela 'controleVoo': $e");
              }
            },
            child: const Text("Iniciar Banco de Dados"),
          ),
        ),
      ),
    );
  }
}
