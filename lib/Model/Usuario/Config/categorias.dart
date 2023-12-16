// @dart=2.17
import 'package:drift/drift.dart';
import 'package:dinkid_mobile/Model/Movimentacoes/tipos_movimentacoes.dart';

@DataClassName('Categoria')
class Categorias extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descricao => text().withLength(min: 2, max: 32)();
  TextColumn get icone => text()();
  TextColumn get cor => text()();
  IntColumn get id_tipos_movimentacao =>
      integer().references(TiposMovimentacao, #id)();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get deletedAt => dateTime()();
}
