import 'package:dinkid_mobile/Providers/Models/Repositories/AbstractRepository.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

class CategoriasRepository
    extends AbstractRepository<$CategoriasTable, Categoria> {
  final AppDatabase _database;

  CategoriasRepository(this._database) : super(_database, _database.categorias);

  Future<int> deleteByAutoIncrement(int id) async {
    var idColumn =
        this.table.$columns.firstWhere((column) => column.hasAutoIncrement);
    var ghostCompanion = CategoriasCompanion(
        isDeleted: Value(true), deletedAt: Value(DateTime.now()));
    return await (_database.update(this.table)
          ..where((tbl) => idColumn.equals(id)))
        .write(ghostCompanion);
  }
}

final categoriasRepositoryProvider = Provider<CategoriasRepository>((ref) {
  final database = ref.read(databaseProvider);
  return CategoriasRepository(database);
});
