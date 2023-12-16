// @dart=2.17
import 'package:drift/drift.dart';

@DataClassName('Usuario')
class Usuarios extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get login => text()();
  TextColumn get senha => text()();
  TextColumn get descricao => text().withLength(min: 2, max: 32)();
  DateTimeColumn get dataUltimoAcesso => dateTime()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get deleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get deletedAt => dateTime()();
}
