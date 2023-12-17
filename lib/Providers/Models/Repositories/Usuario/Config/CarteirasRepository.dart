import 'package:dinkid_mobile/Providers/Models/Repositories/AbstractRepository.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

class CarteirasRepository extends AbstractRepository {
  final AppDatabase _database;

  CarteirasRepository(this._database) : super(_database, _database.categorias);
}

final carteirasRepositoryProvider = Provider<CarteirasRepository>((ref) {
  final database = ref.read(databaseProvider);
  return CarteirasRepository(database);
});
