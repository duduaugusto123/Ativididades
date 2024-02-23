import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coleta de Informações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: idadeController,
              decoration: InputDecoration(labelText: 'Idade'),
            ),
            TextField(
              controller: enderecoController,
              decoration: InputDecoration(labelText: 'Endereço'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: telefoneController,
              decoration: InputDecoration(labelText: 'Telefone'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                exibirInformacoes();
              },
              child: Text('Exibir Informações'),
            ),
          ],
        ),
      ),
    );
  }

  void exibirInformacoes() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informações Pessoais'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nome: ${nomeController.text}'),
              Text('Idade: ${idadeController.text}'),
              Text('Endereço: ${enderecoController.text}'),
              Text('Email: ${emailController.text}'),
              Text('Telefone: ${telefoneController.text}'),
            ], 
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Fechar'),
            ),
          ],

        );
      },
    );
     print("\nInformações Pessoais:");
    print("Nome: ${nomeController.text}");
    print("Idade: ${idadeController.text}");
    print("Endereço: ${enderecoController.text}");
    print("Email: ${emailController.text}");
    print("Telefone: ${telefoneController.text}");
  }
}
