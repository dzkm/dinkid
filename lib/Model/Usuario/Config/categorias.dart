// @dart=2.17
import 'package:drift/drift.dart';
import 'package:dinkid_mobile/Model/Movimentacoes/tipos_movimentacoes.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:dinkid_mobile/Helpers/Icons/IconDataMapping.dart';

var defaultIcon = iconToJson(Icons.question_mark);

@DataClassName('Categoria')
class Categorias extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descricao => text().withLength(min: 2, max: 32)();
  TextColumn get icone => text().withDefault(Constant(defaultIcon))();
  TextColumn get cor => text().withDefault(Constant("838383"))();
  IntColumn get id_tipos_movimentacao =>
      integer().references(TiposMovimentacoes, #id)();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}
