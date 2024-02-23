import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de Média'),
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();
  final TextEditingController _nota4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _nomeController,
            decoration: InputDecoration(labelText: 'Nome do Aluno'),
          ),
          TextField(
            controller: _nota1Controller,
            decoration: InputDecoration(labelText: 'Nota 1'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _nota2Controller,
            decoration: InputDecoration(labelText: 'Nota 2'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _nota3Controller,
            decoration: InputDecoration(labelText: 'Nota 3'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _nota4Controller,
            decoration: InputDecoration(labelText: 'Nota 4'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              calcularMedia();
            },
            child: Text('Calcular Média'),
          ),
        ],
      ),
    );
  }

  void calcularMedia() {
    // Lógica para calcular a média e exibir se o aluno foi aprovado ou não.
    // Você pode implementar isso conforme necessário.
    // Aqui, estou apenas exibindo as notas para ilustração.

    double nota1 = double.tryParse(_nota1Controller.text) ?? 0;
    double nota2 = double.tryParse(_nota2Controller.text) ?? 0;
    double nota3 = double.tryParse(_nota3Controller.text) ?? 0;
    double nota4 = double.tryParse(_nota4Controller.text) ?? 0;

    double media = (nota1 + nota2 + nota3 + nota4) / 4;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Média do Aluno'),
          content: Column(
            children: [
              Text('Nome: ${_nomeController.text}'),
              Text('Média: $media'),
              Text(media >= 6 ? 'Aprovado' : 'Reprovado'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
