import 'package:flutter/material.dart';
import '../models/estufa.dart';
import 'control.dart';

class VerEstufaPage extends StatelessWidget {
  final Estufa estufa;

  const VerEstufaPage({super.key, required this.estufa});

  @override
  Widget build(BuildContext context) {
    // Valores ideais dos parâmetros (exemplo)
    final Map<String, Map<String, double>> valoresIdeais = {
      "Temperatura": {"min": 20, "max": 30},
      "Umidade do Ar": {"min": 50, "max": 70},
      "Umidade do Solo": {"min": 40, "max": 60},
      "Luminosidade": {"min": 600, "max": 1000},
      "CO2": {"min": 350, "max": 450},
    };

    // Função para verificar status
    String status(double valor, double min, double max) {
      if (valor < min) return "Abaixo";
      if (valor > max) return "Acima";
      return "Ideal";
    }

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu), // hamburguer
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
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
          IconButton(
            // ícone usuário
            icon: const Icon(Icons.person),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Perfil do usuário")),
              );
            },
          ),
        ],
      ),

      /// Drawer - menu lateral
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.tune),
              title: const Text("Controle"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EstufaControlePage(estufa: estufa),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.agriculture),
              title: const Text("Ver Estufa"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerEstufaPage(estufa: estufa),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("Histórico"),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Tela de histórico")),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text("Gerenciar Usuários"),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Tela de gerenciar usuários")),
                );
              },
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            // Card Automação
            Card(
              color: estufa.autoAtivada ? Colors.green[100] : Colors.red[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Automação",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      estufa.autoAtivada ? "Ativo" : "Inativo",
                      style: TextStyle(
                        fontSize: 16,
                        color: estufa.autoAtivada ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Card Temperatura
            _buildParametroCard(
              "Temperatura",
              estufa.temperatura,
              valoresIdeais["Temperatura"]!["min"]!,
              valoresIdeais["Temperatura"]!["max"]!,
            ),

            // Card Umidade do Ar
            _buildParametroCard(
              "Umidade do Ar",
              estufa.umidadeAr,
              valoresIdeais["Umidade do Ar"]!["min"]!,
              valoresIdeais["Umidade do Ar"]!["max"]!,
            ),

            // Card Umidade do Solo
            _buildParametroCard(
              "Umidade do Solo",
              estufa.umidadeSolo,
              valoresIdeais["Umidade do Solo"]!["min"]!,
              valoresIdeais["Umidade do Solo"]!["max"]!,
            ),

            // Card Luminosidade
            _buildParametroCard(
              "Luminosidade",
              estufa.luminosidade,
              valoresIdeais["Luminosidade"]!["min"]!,
              valoresIdeais["Luminosidade"]!["max"]!,
            ),

            // Card CO2
            _buildParametroCard(
              "CO2",
              estufa.co2,
              valoresIdeais["CO2"]!["min"]!,
              valoresIdeais["CO2"]!["max"]!,
            ),
          ],
        ),
      ),
    );
  }

  // Função helper para criar os cards de parâmetro
  Widget _buildParametroCard(
      String nome, double valor, double min, double max) {
    String statusTexto;
    Color statusColor;

    if (valor < min) {
      statusTexto = "Abaixo";
      statusColor = Colors.red;
    } else if (valor > max) {
      statusTexto = "Acima";
      statusColor = Colors.red;
    } else {
      statusTexto = "Ideal";
      statusColor = Colors.green;
    }

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nome,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Valor: ${valor.toStringAsFixed(1)}",
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              "Ideal: ${min.toStringAsFixed(0)} - ${max.toStringAsFixed(0)}",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              statusTexto,
              style: TextStyle(fontSize: 14, color: statusColor),
            ),
          ],
        ),
      ),
    );
  }
}
