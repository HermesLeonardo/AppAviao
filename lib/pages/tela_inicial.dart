import 'package:flutter/material.dart';
import 'package:appaviao/pages/login.dart'; // Certifique-se de que o caminho está correto
import 'package:appaviao/pages/tela_cadastro_aeroporto.dart';
import 'package:appaviao/pages/tela_cadastro_controle_voo.dart';
import 'package:appaviao/pages/tela_cadastro_trecho.dart';

class Tela_Inicial extends StatefulWidget {
  const Tela_Inicial({super.key});

  @override
  State<Tela_Inicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<Tela_Inicial> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF003049),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Container(
                  width: size.width,
                  height: 290,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100000),
                      bottomRight: Radius.circular(100000),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/aviaocriartela.png',
                        height: 150, // Aumentar a altura da imagem
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Olá Piloto Fulano!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 40, // Ajuste conforme necessário
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.black, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LoginTela(), // Verifique o nome da classe da tela de login
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildButton(context, 'Cadastrar Trecho', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const tela_cadastro_trecho(),
              ),
            );
          }),
          _buildButton(context, 'Alterar Informações do Cadastro', () {
            // Adicione a funcionalidade aqui, se necessário
          }),
          _buildButton(context, 'Cadastrar Aeroporto', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const tela_cadastro_aeroporto(),
              ),
            );
          }),
          _buildButton(context, 'Cadastrar Controle de VOO', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const tela_cadastro_controle_voo(),
              ),
            );
          }),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(
                100, 0, 100, 0), // Ajustar a largura do botão menor
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Adicione a funcionalidade aqui, se necessário
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003049),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'INICIAR VIAGEM',
                  style: TextStyle(color: Color(0xFF003049)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(25, 0, 25, 30),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20),
            textStyle: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF003049),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Color(0xFF003049)),
          ),
        ),
      ),
    );
  }
}
