import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:dinkid_mobile/Providers/Models/Repositories/Usuario/Config/CarteirasRepository.dart';

class CarteirasController extends StateNotifier<List<Carteira>> {
  final CarteirasRepository _carteirasRepository;

  CarteirasController(this._carteirasRepository) : super([]);

  Future<void> insertCarteira(CarteirasCompanion carteira) async {
    await _carteirasRepository.insert(carteira);
  }

  Future<List<Carteira>> allCarteiras() async {
    var result = await _carteirasRepository.selectAll();
    return result.map((item) => item as Carteira).toList();
  }
}

final carteirasControllerProvider = Provider<CarteirasController>((ref) {
  final carteirasRepository = ref.read(carteirasRepositoryProvider);
  return CarteirasController(carteirasRepository);
});
