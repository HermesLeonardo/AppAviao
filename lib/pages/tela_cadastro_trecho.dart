import 'package:appaviao/Custons/Custom_tela_trecho/caixa_info_widget.dart';
import 'package:appaviao/Custons/Custom_tela_trecho/custom_from_text_field.dart';
import 'package:appaviao/listagem_trecho/itensListaTrecho.dart';
import 'package:appaviao/pages/barra_navegacao.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/DTOS/trechoDTO/trecho_dto.dart';
import 'package:appaviao/classes_dao/trecho_dao.dart';
import 'package:appaviao/listagem_trecho/listagem_trecho.dart';

class tela_cadastro_trecho extends StatefulWidget {
  const tela_cadastro_trecho({super.key});

  @override
  State<tela_cadastro_trecho> createState() => _tela_cadastro_trechoState();
}

class _tela_cadastro_trechoState extends State<tela_cadastro_trecho> {
  final _formKey = GlobalKey<FormState>();
  final deController = TextEditingController();
  final paraController = TextEditingController();
  final trechoController = TextEditingController();
  final proaController = TextEditingController();
  final distController = TextEditingController();
  final corredorController = TextEditingController();
  final altCorredorController = TextEditingController();
  final frequenciaController = TextEditingController();
  final frequenciaAlterController = TextEditingController();

  void _inserirTrecho() {
    final trecho = trecho_dto(
      de_trecho: deController.text,
      para_trecho: paraController.text,
      trecho_trecho: trechoController.text,
      proa_trecho: proaController.text,
      dist_trecho: distController.text,
      corredor_trecho: corredorController.text,
      altCorredor_trecho: altCorredorController.text,
      frequencia_trecho: frequenciaController.text,
      frequenciaAlter_trecho: frequenciaAlterController.text,
    );
    trecho_dao().insertTrecho(trecho);
    // Exibir o AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sucesso"),
          content: const Text("Trecho Salvo com sucesso!!!"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Cadastro de Trecho"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: custom_from_text_field(
                    labelText: 'De',
                    controller: deController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira de onde irá partir';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: custom_from_text_field(
                    labelText: 'Para',
                    controller: paraController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira Para onde irá';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: custom_from_text_field(
                    labelText: 'Trecho',
                    controller: trechoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Trecho de onde irá passar';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ), //espaço entre os campos
                Expanded(
                  child: custom_from_text_field(
                    labelText: 'Proa',
                    controller: proaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a Proa do seu trecho';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: custom_from_text_field(
                    labelText: 'Dist. 184MN',
                    controller: distController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Dist. 184MN do seu trecho';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              width: 50,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: custom_from_text_field(
                    labelText: 'Corredor',
                    controller: corredorController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Corredor do seu trecho';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: custom_from_text_field(
                    labelText: 'Alt. Corredor',
                    controller: altCorredorController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a Altura do Corredor do seu trecho';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: custom_from_text_field(
                    labelText: 'Frequencia',
                    controller: frequenciaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a Frequencia do seu trecho';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: custom_from_text_field(
                    labelText: 'Frequencia. Alt',
                    controller: frequenciaAlterController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a Frequancia alternativa do seu trecho';
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
                  _inserirTrecho();
                }
              },
              child: const Text("Adicionar Trecho"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const listagem_trecho()));
              },
              child: const Text("Visualizar Trechos Cadastrados"),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BarraNavegacao(currentIndex: 0),
    );
  }
}
