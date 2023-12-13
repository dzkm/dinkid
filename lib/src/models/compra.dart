import 'package:dinkid/src/includes/SQLite/sqlite_connection.dart';
import 'package:sqflite/sqflite.dart';

class Compra {
  final int id;
  final int usuarioID;
  final int compraID;
  final int carteiraID;
  final String descricao;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final DateTime deletedAt;

  const Compra(
      {required this.id,
      required this.usuarioID,
      required this.compraID,
      required this.carteiraID,
      required this.descricao,
      required this.createdAt,
      required this.updatedAt,
      required this.deleted,
      required this.deletedAt});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "usuario_id": usuarioID,
      "compra_id": compraID,
      "carteira_id": carteiraID,
      "descricao": descricao,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deleted': deleted,
      'deleted_at': deletedAt.toIso8601String(),
    };
  }

  Future<void> insert(Compra compra) async {
    final db = await getDatabase();
    await db.insert(
      'compras',
      compra.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(Compra compra) async {
    final db = await getDatabase();
    await db.update('compras', compra.toMap(),
        where: 'id = ?', whereArgs: [compra.id]);
  }

  Future<List<Compra>> compras() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('compras');
    return List.generate(
      maps.length,
      (index) => Compra(
        id: maps[index]['id'],
        usuarioID: maps[index]['usuario_id'],
        compraID: maps[index]['compra_id'],
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
      'compras',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  String toString() {
    return 'compra{id: $id, usuarioID: $usuarioID, compraID, $compraID, carteiraID: $carteiraID, descricao: $descricao, createdAt: $createdAt, updatedAt: $updatedAt, deleted: $deleted, deletedAt: $deletedAt}';
  }
}
