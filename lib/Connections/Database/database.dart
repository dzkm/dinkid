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
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

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
  int get schemaVersion => 2;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'dinkid.db'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});
