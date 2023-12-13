import 'package:dinkid/src/includes/SQLite/sqlite_connection.dart';
import 'package:sqflite/sqflite.dart';

class Usuario {
  final int id;
  final String login;
  final String senha;
  final String descricao;
  final DateTime dataUltimoAcesso;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final DateTime deletedAt;

  const Usuario(
      {required this.id,
      required this.login,
      required this.senha,
      required this.descricao,
      required this.dataUltimoAcesso,
      required this.createdAt,
      required this.updatedAt,
      required this.deleted,
      required this.deletedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'senha': senha,
      'descricao': descricao,
      'data_ultimo_acesso': dataUltimoAcesso,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted': deleted,
      'deleted_at': deletedAt,
    };
  }

  Future<void> insert(Usuario usuario) async {
    final db = await getDatabase();
    await db.insert(
      'usuarios',
      usuario.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<void> update(Usuario usuario) async {
    final db = await getDatabase();
    await db.update(
      'usuarios',
      usuario.toMap(),
      where: 'id = ?',
      whereArgs: [usuario.id],
    );
  }

  Future<List<Usuario>> usuarios() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('usuarios');
    return List.generate(
      maps.length,
      (index) => Usuario(
        id: maps[index]['id'],
        login: maps[index]['login'],
        senha: maps[index]['senha'],
        descricao: maps[index]['descricao'],
        dataUltimoAcesso: maps[index]['data_ultimo_acesso'],
        createdAt: maps[index]['created_at'],
        updatedAt: maps[index]['updated_at'],
        deleted: maps[index]['deleted'],
        deletedAt: maps[index]['deleted_at'],
      ),
    );
  }

  Future<void> delete(int id) async {
    final db = await getDatabase();
    await db.delete('usuarios', where: 'id = ?', whereArgs: [id]);
  }
}
