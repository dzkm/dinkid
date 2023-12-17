import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';

class EntradaCarteiraNotifier extends StateNotifier<CarteirasCompanion> {
  EntradaCarteiraNotifier(CarteirasCompanion categoria) : super(categoria);

  void updateCategory(CarteirasCompanion categoria) {
    state = categoria;
  }
}

final entradaCarteiraNotifierProvider =
    StateNotifierProvider<EntradaCarteiraNotifier, CarteirasCompanion>((ref) {
  return EntradaCarteiraNotifier(CarteirasCompanion());
});
