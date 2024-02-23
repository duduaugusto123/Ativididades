import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Jogador {
  final String nome;
  final int idade;
  final int gols;

  Jogador({required this.nome, required this.idade, required this.gols});
}

class MyApp extends StatelessWidget {
  final List<Jogador> jogadores = [
    Jogador(nome: 'Messi', idade: 34, gols: 700),
    Jogador(nome: 'Cristiano Ronaldo', idade: 37, gols: 800),
    Jogador(nome: 'Neymar', idade: 30, gols: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Jogadores de Futebol'),
        ),
        body: ListView.builder(
          itemCount: jogadores.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(jogadores[index].nome),
                subtitle: Text('Idade: ${jogadores[index].idade} - Gols: ${jogadores[index].gols}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
