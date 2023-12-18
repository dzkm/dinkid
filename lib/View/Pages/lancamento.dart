import 'package:flutter/material.dart';
import 'package:dinkid_mobile/Providers/Models/Controllers/Movimentacoes/MovimentacaoController.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:dinkid_mobile/Providers/View/Usuario/Config/Carteira/CarteiraDropdownNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinkid_mobile/View/Widgets/Usuario/Config/Categorias/CategoriaDropdownWidget.dart';

final List<String> wallets = ["Cartão Sicoob", "Débito Nubank", "Dinheiro"];
final entradaButtonColorProvider = StateProvider<Color>((ref) => Colors.grey);
final saidaButtonColorProvider =
    StateProvider<Color>((ref) => Color(0xFF31B0B8));

class Lancamento extends ConsumerWidget {
  Lancamento({Key key}) : super(key: key);
  var valorController = TextEditingController();
  var descricaoController = TextEditingController();
  var walletController = TextEditingController();
  String selectedWallet = wallets[0];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entradaButtonColor = ref.watch(entradaButtonColorProvider);
    final saidaButtonColor = ref.watch(saidaButtonColorProvider);
    final entradaCarteiraNotifier = ref.watch(carteiraDropdownNotifierProvider);
    walletController.text = entradaCarteiraNotifier.descricao.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lançar'),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.cancel), onPressed: () {}),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {},
          ),
        ],
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
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                  color: saidaButtonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Text("Saida",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    ref.read(saidaButtonColorProvider.notifier).state =
                        Color(0xFF31B0B8);
                    ref.read(entradaButtonColorProvider.notifier).state =
                        Color(0xFFA0A0A0);
                  },
                  padding: EdgeInsets.only(
                      top: 25, bottom: 25, left: 50, right: 50)),
              MaterialButton(
                  color: entradaButtonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Text("Entrada",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    ref.read(entradaButtonColorProvider.notifier).state =
                        Color(0xFF31B0B8);
                    ref.read(saidaButtonColorProvider.notifier).state =
                        Color(0xFFA0A0A0);
                  },
                  padding: EdgeInsets.only(
                      top: 25, bottom: 25, left: 50, right: 50)),
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
            child: SizedBox(
                width: 250,
                child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20))),
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
