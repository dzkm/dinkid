import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';

class EntradaCategoriaNotifier extends StateNotifier<Categorias> {
  EntradaCategoriaNotifier(CategoriasCompanion categoria) : super(categoria);

  void updateCategory(CategoriasCompanion categoria) {
    state = categoria;
  }
}
