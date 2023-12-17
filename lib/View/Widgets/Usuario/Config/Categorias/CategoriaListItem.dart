import 'package:dinkid_mobile/Model/Usuario/Config/categorias.dart';
import 'package:flutter/material.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:dinkid_mobile/Helpers/Icons/IconDataMapping.dart';

class CategoriaListItem extends StatelessWidget {
  final Categoria categoria;
  const CategoriaListItem({Key key, Categoria this.categoria})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(jsonToIcon(categoria.icone)),
        title: Text(
          categoria.descricao,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ));
  }
}
