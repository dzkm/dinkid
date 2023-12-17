// @dart=2.17
import 'package:drift/drift.dart';

@DataClassName('Compra')
class Compras extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descricao => text().withLength(min: 2, max: 32)();
  IntColumn get numero_parcelas => integer()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}
