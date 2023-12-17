import 'package:drift/drift.dart';

abstract class InterfaceRepository<T extends Table, D extends DataClass> {
  Future<List<DataClass>> selectAll();
  Future<List<DataClass>> selectAllButDeleted();
  Future<DataClass> selectByAutoIncrement(int autoincrement);
  Future<List<DataClass>> selectWithCustomWhere(
      Expression<bool> Function(Table table) filter);
  Future<int> updateAll(Insertable<DataClass> item);
  Future<bool> updateByAutoIncrement(Insertable<DataClass> item);
  Future<int> updateWithCustomWhere(
      Expression<bool> Function(Table tbl) filter, Insertable<DataClass> item);
  Future<int> deleteByAutoIncrement(int autoincrement);
  Future<int> trueDeleteByAutoIncrement(int id);
  Future<int> insert(Insertable<DataClass> item);
}
