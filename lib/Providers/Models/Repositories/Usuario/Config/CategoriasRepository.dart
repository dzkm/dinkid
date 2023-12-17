import 'package:dinkid_mobile/Providers/Models/Repositories/AbstractRepository.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

class CategoriasRepository extends AbstractRepository {
  final AppDatabase _database;

  CategoriasRepository(this._database) : super(_database, _database.carteiras);
}

final categoriasRepositoryProvider = Provider<CategoriasRepository>((ref) {
  final database = ref.read(databaseProvider);
  return CategoriasRepository(database);
});
