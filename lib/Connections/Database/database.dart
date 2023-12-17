// @dart=2.17
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod/riverpod.dart';
import 'package:dinkid_mobile/Model/Compras/compras.dart';
import 'package:dinkid_mobile/Model/Compras/compras_parcelas.dart';
import 'package:dinkid_mobile/Model/Movimentacoes/movimentacoes.dart';
import 'package:dinkid_mobile/Model/Movimentacoes/tipos_movimentacoes.dart';
import 'package:dinkid_mobile/Model/Usuario/usuario.dart';
import 'package:dinkid_mobile/Model/Usuario/Config/carteiras.dart';
import 'package:dinkid_mobile/Model/Usuario/Config/categorias.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Movimentacoes,
  Usuarios,
  TiposMovimentacoes,
  Carteiras,
  Categorias,
  Compras,
  ComprasParcelas
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 4;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'dinkid.db'));
    return NativeDatabase.createInBackground(file);
  });
}

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});
