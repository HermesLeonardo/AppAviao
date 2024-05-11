import 'package:flutter/material.dart';

class tela_cadastro_aeroporto extends StatefulWidget {
  const tela_cadastro_aeroporto({super.key});

  @override
  State<tela_cadastro_aeroporto> createState() =>
      _tela_cadastro_aeroportoState();
}

class _tela_cadastro_aeroportoState extends State<tela_cadastro_aeroporto> {
  final nomeController = TextEditingController();
  final codigoController = TextEditingController();
  final twrController = TextEditingController();
  final soloController = TextEditingController();
  final cabeceiraController = TextEditingController();
  final firController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
