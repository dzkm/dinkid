// @dart=2.17
import 'package:drift/drift.dart';
import 'package:dinkid_mobile/Model/Compras/compras.dart';
import 'package:dinkid_mobile/Model/Movimentacoes/movimentacoes.dart';

@DataClassName('CompraParcela')
class ComprasParcelas extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get id_compra => integer().references(Compras, #id)();
  IntColumn get numero_parcela => integer()();
  IntColumn get id_movimentacao => integer().references(Movimentacoes, #id)();
  DateTimeColumn get data_prevista => dateTime()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get deletedAt => dateTime()();
}
