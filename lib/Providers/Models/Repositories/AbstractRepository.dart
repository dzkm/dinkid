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
    return _database.update(this.table).write(item);
  }

  Future<int> updateByAutoIncrement(int id, UpdateCompanion<D> item) async {
    var idColumn =
        table.$columns.firstWhere((column) => column.hasAutoIncrement);
    return (_database.update(this.table)..where((tbl) => idColumn.equals(id)))
        .write(item);
  }

  Future<int> updateWithCustomWhere(
      Expression<bool> Function(T tbl) filter, UpdateCompanion<D> item) async {
    return (_database.update(this.table)..where(filter)).write(item);
  }

  Future<int> deleteByPrimaryKey(int id) async {
    var idColumn =
        table.$columns.firstWhere((column) => column.hasAutoIncrement);
    var currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    return (_database.update(this.table)..where((tbl) => idColumn.equals(id)))
        .write(this.table.deleted.set(true) &
            this.table.deletedAt.set(currentTime));
  }

  Future<int> trueDeleteByPrimaryKey(int id) async {
    var idColumn =
        table.$columns.firstWhere((column) => column.hasAutoIncrement);
    return (_database.delete(this.table)..where((tbl) => idColumn.equals(id)))
        .go();
  }
}
