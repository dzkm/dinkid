// @dart=2.17
import 'package:drift/drift.dart';

@DataClassName('Entrada')
class Entradas extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get valor => real()();
  TextColumn get descricao => text().withLength(min: 2, max: 32)();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get deletedAt => dateTime()();
}
