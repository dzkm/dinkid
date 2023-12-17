import 'package:flutter/material.dart';
import 'package:dinkid_mobile/Providers/Models/Controllers/Movimentacoes/MovimentacaoController.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:dinkid_mobile/Providers/View/Usuario/Config/Carteira/CarteiraDropdownNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinkid_mobile/View/Widgets/Usuario/Config/Categorias/CategoriaDropdownWidget.dart';

final List<String> wallets = ["Cartão Sicoob", "Débito Nubank", "Dinheiro"];

class Lancamento extends ConsumerWidget {
  Lancamento({Key key}) : super(key: key);
  var valorController = TextEditingController();
  var descricaoController = TextEditingController();
  var walletController = TextEditingController();
  String selectedWallet = wallets[0];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entradaCarteiraNotifier = ref.watch(carteiraDropdownNotifierProvider);

    walletController.text = entradaCarteiraNotifier.descricao.value;

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
            child: SizedBox(
              width: 75,
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
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
          SizedBox(height: 10),
          Text("Categoria",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          CategoriaDropdownWidget(),
          SizedBox(height: 10),
          Text(
            "Carteira",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          DropdownMenu(
            initialSelection: selectedWallet,
            controller: walletController,
            label: const Text('Color'),
            onSelected: (String wallet) => {selectedWallet = wallet},
            dropdownMenuEntries:
                wallets.map<DropdownMenuEntry<String>>((String wallet) {
              return DropdownMenuEntry<String>(
                value: wallet,
                label: wallet,
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }
}
