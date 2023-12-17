import 'package:dinkid_mobile/Providers/Models/Repositories/AbstractRepository.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

class ComprasParcelasRepository extends AbstractRepository {
  final AppDatabase _database;

  ComprasParcelasRepository(this._database)
      : super(_database, _database.comprasParcelas);
}

final comprasParcelasRepositoryProvider =
    Provider<ComprasParcelasRepository>((ref) {
  final database = ref.read(databaseProvider);
  return ComprasParcelasRepository(database);
});
