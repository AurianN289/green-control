import 'package:flutter/material.dart';
import 'package:green_control/models/estufa.dart';
import '../models/user.dart';
import 'home_null.dart';
import 'control.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  // Exemplo de usuário "registrado no sistema"
  final User usuarioFake = User(
    email: "teste@email.com",
    senha: "1234",
    nome: "Maria Silva",
  );

  final Estufa estufaFake = Estufa(
    nome: "Estufa 1",
    dono: "Maria Silva",
    localizacao: "Sala 1",
    tipoCultivo: "Hortaliças",
    temperatura: 25.0,
    umidadeAr: 40.0,
    umidadeSolo: 45.0,
    co2: 600.0,
    luminosidade: 700.0,
    autoAtivada: true,
    irrigacaoAtiva: false,
    ventilacaoAtiva: true,
    luzArtificialAtiva: false,
    aquecedorAtivo: true,
    janelaAberta: false,
  );

  void _fazerLogin() {
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (email == usuarioFake.email && senha == usuarioFake.senha) {
      if (estufaFake.dono == usuarioFake.nome) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EstufaControlePage(estufa: estufaFake),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email ou senha incorretos")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: _senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: _fazerLogin,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Entrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
