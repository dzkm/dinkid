// @dart=2.17
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:dinkid_mobile/src/Model/Movimentacoes/movimentacoes.dart';
import 'package:dinkid_mobile/src/Model/Usuario/usuario.dart';
import 'package:riverpod/riverpod.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Movimentacoes, Usuarios])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
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
