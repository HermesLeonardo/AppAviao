import 'dart:ui';
import 'package:appaviao/listagem_controlevoo/tela_lista_controlevoo.dart';
import 'package:appaviao/pages/tela_cadastro_aeroporto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tela_cadastro_aeroporto.dart';
import 'tela_cadastro_controle_voo.dart';
import 'tela_cadastro_trecho.dart';
import 'barra_navegacao.dart';

class tela_inicial extends StatelessWidget {
  const tela_inicial({super.key}); // Corrigindo a declaração do construtor

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("AIR TRAVEL"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              color: const Color.fromARGB(255, 0, 48, 73), // Cor azul
            ),
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
                  'assets/images/aviaocriartela.png', // Caminho da imagem
                  fit: BoxFit.cover, // Ajusta a imagem para preencher o espaço
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.35, // Ajuste a posição vertical do texto
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                "Olá Piloto Fulano",
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 255, 255, 255), // Texto em branco
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.62,
              width: size.width,
              padding:
                  const EdgeInsets.only(top: 30.0), // Ajuste de espaçamento
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  SizedBox(
                    height: 60,
                    width: 900,
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
                    width: 900,
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
                          color: Colors.black, // Texto em preto
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 60,
                    width: 900,
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
                    width: 900,
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
                            fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      child: const Text(
                        'Iniciar Viagem',
                        style: TextStyle(
                          fontSize: 20,
                          color:
                              Color.fromARGB(255, 53, 80, 255), // Cor do texto
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BarraNavegacao(currentIndex: 0),
    );
  }
}
