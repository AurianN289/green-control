import 'package:flutter/material.dart';
import '../models/estufa.dart';
import 'estufa.dart';

class EstufaControlePage extends StatefulWidget {
  final Estufa estufa;

  const EstufaControlePage({super.key, required this.estufa});

  @override
  State<EstufaControlePage> createState() => _EstufaControlePageState();
}

class _EstufaControlePageState extends State<EstufaControlePage> {
  @override
  Widget build(BuildContext context) {
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
                        EstufaControlePage(estufa: widget.estufa),
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
                    builder: (context) => VerEstufaPage(estufa: widget.estufa),
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

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSwitch("Automatização", widget.estufa.autoAtivada, (value) {
            setState(() => widget.estufa.autoAtivada = value);
          }),
          _buildSwitch("Irrigação", widget.estufa.irrigacaoAtiva, (value) {
            setState(() => widget.estufa.irrigacaoAtiva = value);
          }),
          _buildSwitch("Ventilação", widget.estufa.ventilacaoAtiva, (value) {
            setState(() => widget.estufa.ventilacaoAtiva = value);
          }),
          _buildSwitch("Luz Artificial", widget.estufa.luzArtificialAtiva, (
            value,
          ) {
            setState(() => widget.estufa.luzArtificialAtiva = value);
          }),
          _buildSwitch("Aquecedor", widget.estufa.aquecedorAtivo, (value) {
            setState(() => widget.estufa.aquecedorAtivo = value);
          }),
          _buildSwitch("Janela", widget.estufa.janelaAberta, (value) {
            setState(() => widget.estufa.janelaAberta = value);
          }),
        ],
      ),
    );
  }

  /// Widget helper para criar cada switch
  Widget _buildSwitch(String titulo, bool valor, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(titulo),
      value: valor,
      onChanged: onChanged,
      activeColor: Colors.green,
    );
  }
}
