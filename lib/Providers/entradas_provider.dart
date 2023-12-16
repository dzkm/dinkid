import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EntradasController extends StateNotifier<List<Entrada>> {
  final AppDatabase _database;
  EntradasController(this._database) : super([]);

  Future<void> insertEntrada(EntradasCompanion entrada) async {
    await _database.into(_database.entradas).insert(entrada);
  }

  Future<List<Entrada>> allEntradas() async {
    return _database.select(_database.entradas).get();
  }

  Future<List<Entrada>> allEntradasInDate(DateTime datetime) async {
    return (_database.select(_database.entradas)
          ..where((tbl) => tbl.createdAt.equals(datetime)))
        .get();
  }

  Future<Entrada> getEntrada(int entradaID) async {
    try {
      return await (_database.select(_database.entradas)
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
    final deletedRow = await (_database.delete(_database.entradas)
          ..where((tbl) => tbl.id.equals(entradaID)))
        .go();
    if (deletedRow <= 0) {
      throw Exception("Falha ao deletar Entrada com ID $entradaID");
    }
    return true;
  }
}

final entradasControllerProvider = Provider<EntradasController>((ref) {
  final database = ref.read(databaseProvider);
  return EntradasController(database);
});
