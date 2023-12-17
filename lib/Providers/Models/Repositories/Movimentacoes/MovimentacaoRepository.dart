import 'package:dinkid_mobile/Providers/Models/Repositories/AbstractRepository.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

class MovimentacaoRepository extends AbstractRepository {
  final AppDatabase _database;

  MovimentacaoRepository(this._database)
      : super(_database, _database.movimentacoes);

  Future<List<Movimentacao>> selectMovimentacaoByDate(
      DateTime selectedDate) async {
    Expression<bool> Function($MovimentacoesTable tbl) filter =
        (tbl) => tbl.createdAt.equals(selectedDate);
    return await selectWithCustomWhere(filter);
  }
}

final movimentacaoRepositoryProvider = Provider<MovimentacaoRepository>((ref) {
  final database = ref.read(databaseProvider);
  return MovimentacaoRepository(database);
});
