import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( // ícone hamburguer
          icon: const Icon(Icons.menu),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Menu aberto")),
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.eco, color: Colors.green), // ícone folhinha
            SizedBox(width: 8),
            Text("Gerenciar Estufa"),
          ],
        ),
        actions: [
          IconButton( // ícone usuário
            icon: const Icon(Icons.person),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Perfil do usuário")),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cadastrar nova estufa")),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text("Cadastrar Estufa"),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(220, 60),
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
