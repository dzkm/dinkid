import 'package:dinkid_mobile/Providers/Models/Repositories/AbstractRepository.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

class CarteirasRepository extends AbstractRepository {
  final AppDatabase _database;

  CarteirasRepository(this._database) : super(_database, _database.categorias);

  Future<int> deleteByAutoIncrement(int id) async {
    var idColumn =
        this.table.$columns.firstWhere((column) => column.hasAutoIncrement);
    var ghostCompanion = CarteirasCompanion(
        isDeleted: Value(true), deletedAt: Value(DateTime.now()));
    return await (_database.update(this.table)
          ..where((tbl) => idColumn.equals(id)))
        .write(ghostCompanion);
  }
}

final carteirasRepositoryProvider = Provider<CarteirasRepository>((ref) {
  final database = ref.read(databaseProvider);
  return CarteirasRepository(database);
});
