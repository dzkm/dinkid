import 'package:dinkid_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:dinkid_mobile/src/providers/entradas_provider.dart';
import 'package:dinkid_mobile/src/includes/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Lancamento extends ConsumerWidget {
  Lancamento({Key key}) : super(key: key);
  var valorController = TextEditingController();
  var descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lançamento"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            "Tipo da movimentação",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                  color: Colors.grey,
                  child: Text("Saida"),
                  onPressed: () {},
                  padding: EdgeInsets.all(35)),
              MaterialButton(
                  color: Colors.lightGreen,
                  child: Text("Entrada"),
                  onPressed: () {},
                  padding: EdgeInsets.all(35)),
            ],
          ),
          SizedBox(height: 10),
          Text("Valor",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'R\$ 0,00',
                ),
              ),
            ),
          ),
          Text(
            "Descrição",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(child: TextField()),
          ),
        ]),
      ),
    );
  }
}
