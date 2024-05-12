import 'package:appaviao/Custons/Custom_tela_aeroporto/custom_from_text_field_aero.dart';
import 'package:flutter/material.dart';

class tela_cadastro_aeroporto extends StatefulWidget {
  const tela_cadastro_aeroporto({super.key});

  @override
  State<tela_cadastro_aeroporto> createState() =>
      _tela_cadastro_aeroportoState();
}

class _tela_cadastro_aeroportoState extends State<tela_cadastro_aeroporto> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final codigoController = TextEditingController();
  final twrController = TextEditingController();
  final soloController = TextEditingController();
  final cabeceiraController = TextEditingController();
  final firController = TextEditingController();
  final metragemPistaController = TextEditingController();
  final patioController = TextEditingController();

  final Map<String, String> _formData = {
    'Nome': '',
    'codigo': '',
    'twr': '',
    'solo': '',
    'cabeceira': '',
    'fir': '',
    'metragemPista': '',
    'patio': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(211, 216, 216, 216),
      appBar: AppBar(
        title: const Text('Cadastro de Aeroporto'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'Nome',
                    onSaved: (value) => _formData['Nome'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira do Nome do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aqui você salvaria os dados no SQLite
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
