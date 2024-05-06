//No uso de navegadores para rodar a aplicação, desmarcar esse import
//import 'dart:html';

import 'package:appaviao/Custons/Custom_tela_trecho/caixa_info_widget.dart';
import 'package:appaviao/Custons/Custom_tela_trecho/custom_from_text_field.dart';
import 'package:flutter/material.dart';

class tela_cadastro_trecho extends StatefulWidget {
  const tela_cadastro_trecho({super.key});

  @override
  State<tela_cadastro_trecho> createState() => _tela_cadastro_trechoState();
}

class _tela_cadastro_trechoState extends State<tela_cadastro_trecho> {
  final _formKey = GlobalKey<FormState>();
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
    'FIR': '',
    'Cruzada. de FIR': '',
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
  }

  List<TrechoInfoWidget> trechoInfoWidgets = [];

  void _addTrecho() {
    setState(() {
      trechoInfoWidgets.add(
        TrechoInfoWidget(
          de: _formData['De']!,
          para: _formData['Para']!,
          trecho: _formData['Trecho']!,
          corredor: _formData['Corredor']!,
          onEdit: () {},
          onDelete: () {},
        ),
      );
    });
  }

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
                    onSaved: (value) => _formData['De'] = value ?? '',
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
                    onSaved: (value) => _formData['Para'] = value ?? '',
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
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Trecho'),
                    onSaved: (Value) {
                      _formData['Trecho'] = Value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Trecho da sua viagem';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ), //espaço entre os campos
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Proa'),
                    onSaved: (Value) {
                      _formData['Proa'] = Value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a Proa da sua viagem';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ), //espaço entre os campos
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Corredor'),
                    onSaved: (Value) {
                      _formData['Corredor'] = Value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Corredor do trecho';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ), //espaço entre os campos

                const SizedBox(
                  width: 10,
                ), //espaço

                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              width: 300,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _addTrecho(); // Adiciona o trecho à lista de widgets
                }
              },
              child: const Text("Adicionar Trecho"),
            ),
            if (trechoInfoWidgets.isNotEmpty)
              SizedBox(
                height: 300, // Defina uma altura adequada
                child: ListView.builder(
                  itemCount: trechoInfoWidgets.length,
                  itemBuilder: (context, index) {
                    return trechoInfoWidgets[index];
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
