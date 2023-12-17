import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:dinkid_mobile/Providers/Models/Controllers/Usuario/Config/CategoriasController.dart';
import 'package:dinkid_mobile/View/Widgets/Usuario/Config/Categorias/CategoriaListItem.dart';

class CategoriaListView extends ConsumerWidget {
  const CategoriaListView({Key key}) : super(key: key);

  Widget body(BuildContext context, AsyncSnapshot<List<Categoria>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (snapshot.hasData) {
      if (snapshot.data.length <= 0) {
        return const Text('Nenhuma categoria cadastrada.');
      }
      return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoriaListItem(
            categoria: snapshot.data[index],
          );
        },
      );
    }
    return const Text('Erro ao carregar categorias');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(categoriasControllerProvider);
    return FutureBuilder(
      future: controller.allCategorias(),
      builder: body,
    );
  }
}
