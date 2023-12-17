import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';

class CategoriaDropdownNotifier extends StateNotifier<CategoriasCompanion> {
  CategoriaDropdownNotifier(CategoriasCompanion categoria) : super(categoria);

  void updateCategory(CategoriasCompanion categoria) {
    state = categoria;
  }
}

final categoriaDropdownNotifierProvider =
    StateNotifierProvider<CategoriaDropdownNotifier, CategoriasCompanion>(
        (ref) {
  return CategoriaDropdownNotifier(CategoriasCompanion());
});
