// @dart=2.17
import 'package:drift/drift.dart';
import 'package:dinkid_mobile/Model/Usuario/Config/carteiras.dart';
import 'package:dinkid_mobile/Model/Usuario/Config/categorias.dart';

@DataClassName('Movimentacao')
class Movimentacoes extends Table {
  IntColumn get id => integer().autoIncrement()();
  Int64Column get valor => int64()();
  TextColumn get descricao => text().withLength(min: 2, max: 32)();
  IntColumn get id_categoria => integer().references(Categorias, #id)();
  IntColumn get id_carteira => integer().references(Carteiras, #id)();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}
