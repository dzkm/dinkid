import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:dinkid_mobile/Providers/Models/Controllers/Usuario/Config/CategoriasController.dart';
import 'package:dinkid_mobile/Providers/View/Movimentacao/movimentacao_categoria_notifier.dart';
import 'package:dinkid_mobile/View/Widgets/Generic/RoundedIconWithBackground.dart';
import 'package:dinkid_mobile/Helpers/Icons/IconDataMapping.dart';

class CategoriaDropdownWidget extends ConsumerWidget {
  const CategoriaDropdownWidget({Key key}) : super(key: key);

  Widget body(BuildContext context, AsyncSnapshot<List<Categoria>> snapshot) {
    if (snapshot.hasError) {
      return const Text('Erro ao carregar categorias');
    }
    if (snapshot.hasData) {
      if (snapshot.data.length <= 0) {
        return const Text('Nenhuma categoria cadastrada');
      }
      var categoriaController = TextEditingController();
      final Color Function(String) categoriaHexColor =
          (String hexCor) => Color(int.parse('FF' + hexCor, radix: 16));

      return DropdownMenu(
        controller: categoriaController,
        dropdownMenuEntries: snapshot.data
            .map<DropdownMenuEntry<Categoria>>(
                (Categoria categoria) => DropdownMenuEntry<Categoria>(
                      value: categoria,
                      label: categoria.descricao,
                      leadingIcon: RoundedIconWithBackground(
                        width: 50,
                        height: 50,
                        boxColor: categoriaHexColor(categoria.cor),
                        icon: jsonToIcon(categoria.icone),
                        iconColor: categoriaHexColor(categoria.cor),
                      ),
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
    CategoriasController controller = ref.watch(categoriasControllerProvider);
    final entradaCategoriaNotifier =
        ref.watch(entradaCategoriaNotifierProvider);

    return FutureBuilder<List<Categoria>>(
      future: controller.allCategorias(),
      builder: body,
    );
  }
}
