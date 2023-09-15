import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:calculadora_imc/models/imc_result.dart';

class IMCDatabaseHelper {
  static final IMCDatabaseHelper _instance = IMCDatabaseHelper._internal();

  factory IMCDatabaseHelper() => _instance;

  IMCDatabaseHelper._internal();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'imc_database.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS imc_data (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        imc REAL,
        classification REAL,
        date TEXT
      )
    ''');
  }

  // Função para adicionar um resultado IMC ao banco de dados
  Future<void> adicionarDadoIMC(
      IMCResult result, double weight, double height, String string) async {
    final db = await database;
    await db?.insert('imc_data', result.toMap());
  }

  // Função para listar todos os resultados IMC no banco de dados
  Future<List<IMCResult>> listarDadosIMC() async {
    final db = await database;
    final results = await db!.query('imc_data');
    return results.map((map) => IMCResult.fromMap(map)).toList();
  }

  // Função para buscar um resultado IMC pelo ID no banco de dados
  Future<IMCResult?> buscarDadoIMC(int id) async {
    final db = await database;
    final results =
        await db!.query('imc_data', where: 'id = ?', whereArgs: [id]);
    return results.isNotEmpty ? IMCResult.fromMap(results.first) : null;
  }

  // Função para atualizar um resultado IMC no banco de dados
  Future<void> atualizarDadoIMC(IMCResult result) async {
    final db = await database;
    await db?.update('imc_data', result.toMap(),
        where: 'id = ?', whereArgs: [result.id]);
  }

  // Função para deletar um resultado IMC do banco de dados pelo ID
  Future<void> deletarDadoIMC(int id) async {
    final db = await database;
    await db?.delete('imc_data', where: 'id = ?', whereArgs: [id]);
  }

  // Método para fechar o banco de dados
  Future<void> closeDatabase() async {
    final db = await database;
    await db?.close();
  }
}
