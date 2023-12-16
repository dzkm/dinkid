import 'package:dinkid_mobile/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:dinkid_mobile/Providers/entradas_provider.dart';
import 'package:dinkid_mobile/Connections/Database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Category {
  final String label;
  final Color color;
  final IconData icon;

  const Category(this.label, this.color, this.icon);
}

const Category hardware =
    Category('Hardware', Colors.lightBlue, Icons.smartphone);
const Category roupas = Category('Roupas', Colors.red, Icons.person);
const Category essenciais =
    Category('Essenciais', Colors.yellow, Icons.local_gas_station);
const Category movimentacao =
    Category('Movimentação', Colors.orange, Icons.gps_fixed);

final List<Category> categories = [hardware, roupas, essenciais, movimentacao];
final List<String> wallets = ["Cartão Sicoob", "Débito Nubank", "Dinheiro"];

class Lancamento extends ConsumerWidget {
  Lancamento({Key key}) : super(key: key);
  var valorController = TextEditingController();
  var descricaoController = TextEditingController();
  var categoryController = TextEditingController();
  var walletController = TextEditingController();
  Category selectedCategory = hardware;
  String selectedWallet = wallets[0];

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
          DropdownMenu(
            initialSelection: hardware,
            controller: categoryController,
            leadingIcon: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: selectedCategory.color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(selectedCategory.icon),
            ),
            label: const Text('Color'),
            onSelected: (Category category) => {selectedCategory = category},
            dropdownMenuEntries: categories
                .map<DropdownMenuEntry<Category>>((Category category) {
              return DropdownMenuEntry<Category>(
                value: category,
                label: category.label,
                leadingIcon: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: category.color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(category.icon),
                ),
                enabled: category.label != 'Grey',
                style: MenuItemButton.styleFrom(
                  foregroundColor: category.color,
                ),
              );
            }).toList(),
          ),
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
