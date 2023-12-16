// @dart=2.17
import 'package:drift/drift.dart';

@DataClassName('TipoMovimentacao')
class TiposMovimentacao extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descricao => text().withLength(min: 2, max: 32)();
  BoolColumn get aceita_saida => boolean().withDefault(Constant(true))();
  BoolColumn get aceita_entrada => boolean().withDefault(Constant(true))();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get deletedAt => dateTime()();
}
