import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';

class CarteiraDropdownNotifier extends StateNotifier<CarteirasCompanion> {
  CarteiraDropdownNotifier(CarteirasCompanion categoria) : super(categoria);

  void updateCategory(CarteirasCompanion categoria) {
    state = categoria;
  }
}

final carteiraDropdownNotifierProvider =
    StateNotifierProvider<CarteiraDropdownNotifier, CarteirasCompanion>((ref) {
  return CarteiraDropdownNotifier(CarteirasCompanion());
});
