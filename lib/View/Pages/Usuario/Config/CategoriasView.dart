import 'package:flutter/material.dart';
import 'package:dinkid_mobile/View/Widgets/Usuario/Config/Categorias/CategoriaListView.dart';

class CategoriasView extends StatelessWidget {
  const CategoriasView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/categoria');
            },
          ),
        ],
      ),
      body: Center(child: CategoriaListView()),
    );
  }
}
