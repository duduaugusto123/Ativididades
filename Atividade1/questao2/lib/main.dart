import 'package:flutter/material.dart';

void main() {
  runApp(ListaComprasApp());
}

class Comida {
  String nome;
  double valor;

  Comida(this.nome, this.valor);
}

class ListaComprasApp extends StatelessWidget {
  final List<Comida> comidas = [
    Comida('Arroz', 5.0),
    Comida('Feijão', 3.0),
    Comida('Carne', 10.0),
    Comida('Vegetais', 4.0),
  ];

  double calcularValorTotal() {
    return comidas.fold(0, (total, comida) => total + comida.valor);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Compras'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Comidas na lista:'),
              Expanded(
                child: ListView.builder(
                  itemCount: comidas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${comidas[index].nome}'),
                      subtitle: Text('R\$ ${comidas[index].valor.toStringAsFixed(2)}'),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Text('Valor total da compra: R\$ ${calcularValorTotal().toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
    );
  }
}
