import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:dinkid_mobile/Providers/Models/Repositories/Usuario/Config/CarteirasRepository.dart';
import 'package:dinkid_mobile/Providers/View/Usuario/Config/Carteira/CarteiraDropdownNotifier.dart';
import 'package:dinkid_mobile/Providers/Models/Controllers/Usuario/Config/CarteirasController.dart';
import 'package:dinkid_mobile/View/Widgets/Generic/RoundedIconWithBackground.dart';
import 'package:dinkid_mobile/Helpers/Icons/IconDataMapping.dart';

class CarteiraDropdownWidget extends ConsumerWidget {
  const CarteiraDropdownWidget({Key key}) : super(key: key);

  Widget body(BuildContext context, AsyncSnapshot<List<Carteira>> snapshot) {
    if (snapshot.hasError) {
      return const Text('Erro ao carregar categorias');
    }
    if (snapshot.hasData) {
      if (snapshot.data.length <= 0) {
        return const Text('Nenhuma categoria cadastrada');
      }
      var categoriaController = TextEditingController();

      return DropdownMenu(
        controller: categoriaController,
        dropdownMenuEntries: snapshot.data
            .map<DropdownMenuEntry<Carteira>>(
                (Carteira carteira) => DropdownMenuEntry<Carteira>(
                      value: carteira,
                      label: carteira.descricao,
                    ))
            .toList(),
      );
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CarteirasController controller = ref.watch(carteirasControllerProvider);
    final carteiraDropdownNotifier =
        ref.watch(carteiraDropdownNotifierProvider);

    return FutureBuilder<List<Carteira>>(
      future: controller.allCarteiras(),
      builder: body,
    );
  }
}
