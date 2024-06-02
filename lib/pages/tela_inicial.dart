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
=======
import 'package:appaviao/listagem_controlevoo/tela_lista_controlevoo.dart';
import 'package:appaviao/pages/tela_cadastro_aeroporto.dart';
import 'package:appaviao/listagem_geral/tela_listagem_geral.dart';
import 'package:flutter/material.dart';
import 'tela_cadastro_trecho.dart';
import 'barra_navegacao.dart';

class tela_inicial extends StatelessWidget {
  const tela_inicial({super.key}); // Corrigindo a declaração do construtor

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
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("AIR TRAVEL"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: const Color.fromARGB(255, 0, 48, 73), // Cor azul
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.3,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  'assets/images/aviaocriartela.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.35,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                "Olá Piloto Fulano",
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.62,
              width: size.width,
              padding: const EdgeInsets.only(top: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    SizedBox(
                      height: 60,
                      width:
                          900, // Ajustando o tamanho para melhor visualização
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  const tela_cadastro_trecho()),
                            ),
                          );
                        },
                        child: const Text(
                          'Cadastrar Trecho',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      width:
                          900, // Ajustando o tamanho para melhor visualização
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        onPressed: () {
                          // Add functionality for 'Alterar Informações do Cadastro' button
                        },
                        child: const Text(
                          'Alterar Informações do Cadastro',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      width:
                          900, // Ajustando o tamanho para melhor visualização
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  const tela_cadastro_aeroporto()),
                            ),
                          );
                        },
                        child: const Text(
                          'Cadastrar Aeroporto',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black, // Texto em preto
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      width:
                          900, // Ajustando o tamanho para melhor visualização
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const tela_lista_controlevoo())),
                          );
                        },
                        child: const Text(
                          'Cadastrar controle de voo',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      width:
                          900, // Ajustando o tamanho para melhor visualização
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const TelaListagemGeral())),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        child: const Text(
                          'Iniciar Viagem',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(
                                255, 53, 80, 255), // Cor do texto
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BarraNavegacao(currentIndex: 0),
    );
  }
}
