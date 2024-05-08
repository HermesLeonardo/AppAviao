import 'dart:ui';

import 'package:appaviao/pages/tela_cadastro_trecho.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class tela_inicial extends StatelessWidget {
  const tela_inicial({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("AIR TRAVEL"),
        backgroundColor: const Color.fromARGB(255, 69, 159, 227),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(200)),
              child: Container(
                height: size.height * 0.6,
                width: size.width * 0.5,
                color: const Color.fromARGB(255, 0, 48, 73),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.5,
                width: size.height,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(120)),
                ),
              ),
            ),
            Form(
                child: Column(
              children: [
                const SizedBox(height: 30),
                const SizedBox(height: 330, width: 40000),
                SizedBox(
                  height: 100,
                  width: 600,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 69, 159, 227)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const tela_cadastro_trecho())));
                    },
                    child: const Text(
                      'Cadastrar Trecho',
                      style: TextStyle(
                        fontSize: 32,
                        color: Color.fromARGB(255, 247, 247, 247),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 100,
                  width: 600,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 69, 159, 227)),
                    ),
                    onPressed: () {
                      //print('Alterar Informações do Cadastro');
                    },
                    child: const Text(
                      'Alterar Informações do Cadastro',
                      style: TextStyle(
                          fontSize: 32,
                          color: Color.fromARGB(255, 247, 247, 247)),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 100,
                  width: 600,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 69, 159, 227)),
                    ),
                    onPressed: () {
                      //print('Cadastrar Aeroporto');
                    },
                    child: const Text(
                      'Cadastrar Aeroporto',
                      style: TextStyle(
                          fontSize: 32,
                          color: Color.fromARGB(255, 247, 247, 247)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                const SizedBox(height: 1.0),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Iniciar Viagem')),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
