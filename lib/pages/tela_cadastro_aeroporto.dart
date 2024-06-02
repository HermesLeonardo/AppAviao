import 'package:appaviao/Custons/Custom_tela_aeroporto/custom_from_text_field_aero.dart';
import 'package:appaviao/DTOS/aeroportoDTO/aeroporto_dto.dart';
import 'package:appaviao/classes_dao/aeroporto_dao.dart';
import 'package:appaviao/listagem_aeroporto/TesteListagem.dart';
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

  void _inserirAeroporto() {
    final aeroporto = aeroporto_dto(
      nome_aero: nomeController.text,
      codigo_aero: codigoController.text,
      twr_aero: twrController.text,
      solo_aero: soloController.text,
      cabeceira_aero: cabeceiraController.text,
      fir_aero: firController.text,
      metragem_pista: metragemPistaController.text,
      patio_aero: patioController.text,
    );
    aeroporto_dao().insertAeroporto(aeroporto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
                    controller: nomeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Nome do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'Codigo',
                    controller: codigoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Codigo do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'Cabeceira',
                    controller: cabeceiraController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a Cabeceira do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: <Widget>[
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'TWR',
                    controller: twrController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o TWR do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'Solo',
                    controller: soloController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Solo do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'Patio',
                    controller: patioController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Pátio do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: <Widget>[
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'FIR',
                    controller: firController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o FIR do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'MetragemPista',
                    controller: metragemPistaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a Metragem da pista do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _inserirAeroporto();
                }
              },
              child: const Text("Adicionar Aeroporto"),
            ),
            const SizedBox(height: 10), // Espaço entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TesteListagem()));
              },
              child: const Text("Visualizar Aeroportos Cadastrados"),
            ),
          ],
        ),
      ),
    );
  }
}
