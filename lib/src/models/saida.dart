import 'package:dinkid/src/includes/SQLite/sqlite_connection.dart';
import 'package:sqflite/sqflite.dart';

class Saida {
  final int id;
  final int userID;
  final int saidaID;
  final int carteiraID;
  final String descricao;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final DateTime deletedAt;

  const Saida({
    required this.id,
    required this.userID,
    required this.saidaID,
    required this.carteiraID,
    required this.descricao,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.deletedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userID,
      'saida_id': saidaID,
      'carteira_id': carteiraID,
      'descricao': descricao,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deleted': deleted,
      'deleted_at': deletedAt.toIso8601String(),
    };
  }

  Future<void> insert(Saida saida) async {
    final db = await getDatabase();
    await db.insert(
      'saidas',
      saida.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(Saida saida) async {
    final db = await getDatabase();
    await db.update('saidas', saida.toMap(),
        where: 'id = ?', whereArgs: [saida.id]);
  }

  Future<List<Saida>> saidas() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('saidas');
    return List.generate(
      maps.length,
      (index) => Saida(
        id: maps[index]['id'],
        userID: maps[index]['user_id'],
        saidaID: maps[index]['saida_id'],
        carteiraID: maps[index]['carteira_id'],
        descricao: maps[index]['descricao'],
        createdAt: maps[index]['created_at'],
        updatedAt: maps[index]['updated_at'],
        deleted: maps[index]['deleted'],
        deletedAt: maps[index]['deleted_at'],
      ),
    );
  }

  Future<void> delete(int id) async {
    final db = await getDatabase();
    await db.delete(
      'saidas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  String toString() {
    return 'Saida{id: $id, userID: $userID, saidaID: $saidaID, carteiraID: $carteiraID, descricao: $descricao, createdAt: $createdAt, updatedAt: $updatedAt, deleted: $deleted, deletedAt: $deletedAt}';
  }
}
