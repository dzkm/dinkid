import 'package:drift/drift.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';

abstract class AbstractRepository<T extends Table, D extends DataClass> {
  final AppDatabase _database;
  final TableInfo<T, D> table;
  AbstractRepository(this._database, this.table);
  Future<List<D>> selectAll() async {
    return await _database.select(this.table).get();
  }

  Future<D> selectByAutoIncrement(int id) async {
    try {
      var idColumn =
          table.$columns.firstWhere((column) => column.hasAutoIncrement);
      return await (_database.select(this.table)
            ..where((tbl) => idColumn.equals(id)))
          .getSingle();
    } catch (e) {
      if (e is StateError) {
        return null;
      } else {
        rethrow;
      }
    }
  }

  Future<List<D>> selectWithCustomWhere(
      Expression<bool> Function(T tbl) filter) async {
    try {
      return await (_database.select(this.table)..where(filter)).get();
    } catch (e) {
      if (e is StateError) {
        return null;
      } else {
        rethrow;
      }
    }
  }

  Future<int> updateAll(UpdateCompanion<D> item) async {
    return await _database.update(this.table).write(item);
  }

  Future<bool> updateByAutoIncrement(UpdateCompanion<D> item) async {
    var idColumn =
        table.$columns.firstWhere((column) => column.hasAutoIncrement);
    return await (_database.update(this.table).replace(item));
  }

  Future<int> updateWithCustomWhere(
      Expression<bool> Function(T tbl) filter, UpdateCompanion<D> item) async {
    return await (_database.update(this.table)..where(filter)).write(item);
  }

  Future<int> trueDeleteByAutoIncrement(int id) async {
    var idColumn =
        table.$columns.firstWhere((column) => column.hasAutoIncrement);
    return await (_database.delete(this.table)
          ..where((tbl) => idColumn.equals(id)))
        .go();
  }

  Future<int> insert(Insertable<D> item) async {
    return await _database.into(this.table).insert(item);
  }
}
