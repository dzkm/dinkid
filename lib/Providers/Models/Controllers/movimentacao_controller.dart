import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovimentacaoController extends StateNotifier<List<Movimentacao>> {
  final AppDatabase _database;
  MovimentacaoController(this._database) : super([]);

  Future<void> insetMovimentacao(MovimentacoesCompanion movimentacao) async {
    await _database.into(_database.movimentacoes).insert(movimentacao);
  }

  Future<List<Movimentacao>> allMovimentacoes() async {
    return _database.select(_database.movimentacoes).get();
  }

  Future<List<Movimentacao>> allMovimentacoesInDate(DateTime datetime) async {
    return (_database.select(_database.movimentacoes)
          ..where((tbl) => tbl.createdAt.equals(datetime)))
        .get();
  }

  Future<Movimentacao> getEntrada(int entradaID) async {
    try {
      return await (_database.select(_database.movimentacoes)
            ..where((tbl) => tbl.id.equals(entradaID)))
          .getSingle();
    } catch (e) {
      if (e is StateError) {
        return null;
      } else {
        rethrow;
      }
    }
  }

  Future<bool> deleteEntrada(int entradaID) async {
    final deletedRow = await (_database.delete(_database.movimentacoes)
          ..where((tbl) => tbl.id.equals(entradaID)))
        .go();
    if (deletedRow <= 0) {
      throw Exception("Falha ao deletar Entrada com ID $entradaID");
    }
    return true;
  }
}

final movimentacaoControllerProvider = Provider<MovimentacaoController>((ref) {
  final database = ref.read(databaseProvider);
  return MovimentacaoController(database);
});
