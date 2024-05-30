//No uso de navegadores para rodar a aplicação, desmarcar esse import para debug


import 'package:appaviao/Custons/Custom_tela_trecho/caixa_info_widget.dart';
import 'package:appaviao/Custons/Custom_tela_trecho/custom_from_text_field.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/DTOS/trechoDTO/trecho_dto.dart';
import 'package:appaviao/classes_dao/trecho_dao.dart';

class tela_cadastro_trecho extends StatefulWidget {
  const tela_cadastro_trecho({super.key});

  @override
  State<tela_cadastro_trecho> createState() => _tela_cadastro_trechoState();
}



class _tela_cadastro_trechoState extends State<tela_cadastro_trecho> {
 /*  final _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> _formDatas = [];
  final Map<String, String> _formData = {
    'De': '',
    'Para': '',
    'Trecho': '',
    'Proa': '',
    'Dist.184MN': '',
    'Corredor': '',
    'Alt.Corredor': '',
    'Frequencia': '',
    'Frequencia.alter': '',
  };

  bool _showInformation = false;

  void _salvarFormulario() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _showInformation = true;
      });
      print(_formData);
    }
  } */

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
  }


 // List<TrechoInfoWidget> trechoInfoWidgets = [];

/*   void _addTrecho() {
    setState(() {
      trechoInfoWidgets.add(
        TrechoInfoWidget(
          de: _formData['De']!,
          para: _formData['Para']!,
          trecho: _formData['Trecho']!,
          corredor: _formData['Corredor']!,
          //altcorredor: _formData['altcorredor']!,
          proa: _formData['Proa']!,
          //Dist184MN: _formData['Dist184MN']!,
          //frequencia: _formData['frequencia']!,
          //frequenciaalter: _formData['frequenciaalter']!,
          onEdit: () {},
          onDelete: () {},
        ),
      );
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(211, 216, 216, 216),
      appBar: AppBar(
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
                ), //espaço entre os campos
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
            /* if (trechoInfoWidgets.isNotEmpty)
              SizedBox(
                height: 500, // Defina uma altura adequada
                child: ListView.builder(
                  itemCount: trechoInfoWidgets.length,
                  itemBuilder: (context, index) {
                    return (trechoInfoWidgets[index]);
                  },
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _addTrecho(); // Adiciona o trecho à lista de widgets
                }
              },
              child: const Text("Adicionar Trecho"),
            ), */
            
          ],
        ),
      ),
    );
  }
}
