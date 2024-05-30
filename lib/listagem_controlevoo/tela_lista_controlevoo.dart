import 'package:appaviao/pages/tela_cadastro_controle_voo.dart';
import 'package:flutter/material.dart';

class tela_lista_controlevoo extends StatefulWidget {
  const tela_lista_controlevoo({super.key});

  @override
  State<tela_lista_controlevoo> createState() => _tela_lista_controlevooState();
}

class _tela_lista_controlevooState extends State<tela_lista_controlevoo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const tela_cadastro_controle_voo()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
