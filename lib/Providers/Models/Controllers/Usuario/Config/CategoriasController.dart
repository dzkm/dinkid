import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:dinkid_mobile/Providers/Models/Repositories/Usuario/Config/CategoriasRepository.dart';

class CategoriasController extends StateNotifier<List<Categoria>> {
  final AppDatabase _database;
  final CategoriasRepository _categoriaRepository;

  CategoriasController(this._database, this._categoriaRepository) : super([]);

  Future<void> insertCategoria(CategoriasCompanion categoria) async {
    await _categoriaRepository.insert(categoria);
  }

  Future<List<Categoria>> allCategorias() async {
    return _categoriaRepository.selectAll();
  }
}

final categoriasControllerProvider = Provider<CategoriasController>((ref) {
  final database = ref.read(databaseProvider);
  final categoriaRepository = ref.read(categoriasRepositoryProvider);
  return CategoriasController(database, categoriaRepository);
});
