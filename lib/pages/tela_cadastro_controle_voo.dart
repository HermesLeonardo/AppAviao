import 'package:appaviao/Custons/custom_tela_controle_voo/custom_from_text_field_controlevoo.dart';
import 'package:appaviao/listagem_controlevoo/tela_lista_controlevoo.dart';
import 'package:appaviao/pages/barra_navegacao.dart';
import 'package:flutter/material.dart';
import '../Custons/custom_tela_controle_voo/caixa_info_widget_controlevoo.dart';
import '../DTOS/controleVooDTO/controleVoo_dto.dart';

class tela_cadastro_controle_voo extends StatefulWidget {
  const tela_cadastro_controle_voo({super.key});

  @override
  State<tela_cadastro_controle_voo> createState() =>
      _tela_cadastro_controle_vooState();
}

class _tela_cadastro_controle_vooState
    extends State<tela_cadastro_controle_voo> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> _formDatas = [];
  final Map<String, String> _formData = {
    'Data-Viagem': '',
    'aeronave': '',
    'viagem': '',
    'controle': '',
    'lat': '',
    'long': '',
    'QNH local': '',
    'QNH dest': '',
    'radio': '',
    'tranponder de emergencia': '',
    'tranponder 1': '',
    'elevaçao destino': '',
    'elevaçao local': '',
    'tempo voo esti': '',
    'altitude obrigatorio': '',
    'alternativo 1': '',
    'alternativo 2': '',
  };
  final dataViagemController = TextEditingController();

  bool _showInformation = false;

  void _salvarControledeVoo() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _showInformation = true;
      });
      print(_formData);
    }
  }

  List<ControleVooInfoWidget> controleVooInforWidgets = [];

  //Verificar se for necessário criar um addControleVoo
  /*
  void _addControleVoo() {
    setState(() {
      controleVooInforWidgets.add(
        const ControleVooInfoWidget(
          dataviagem: _formData['Data-Viagem']!,
        ),
      );
    });
  }
  */

  void _inserirControlevoo() {
    final controlevoo = controleVoo_dto(
        //dataViagem: dataViagemController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          "Controle de Voo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 39, 179, 255),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "Data da Viagem",
                    controller: dataViagemController,
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a data da viagem';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "AERONAVE",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a aeronave';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "Viagem",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a viagem';
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
                  child: custom_from_text_field_controle_voo(
                    labelText: "Controle",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o controle';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "Lat",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Lat';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "Long",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Long';
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
                  child: custom_from_text_field_controle_voo(
                    labelText: "QNH Local",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o QNH Local';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "QNH Dest",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o QNH Dest';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "QNH Rádio",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o WNH Rádio';
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
                  child: custom_from_text_field_controle_voo(
                    labelText: "Transponder de Emergência",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Transponder de Emergência';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "Tranponder 1",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Tranponder 1';
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
                  child: custom_from_text_field_controle_voo(
                    labelText: "Elevação destino",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a Elevação destino';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "Elevação local",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a Elevação local';
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
                  child: custom_from_text_field_controle_voo(
                    labelText: "Tempo de Voo Esti",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Tempo de Voo Esti';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "Altitude Obrigatoria",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a data da viagem';
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
                  child: custom_from_text_field_controle_voo(
                    labelText: "Alternativo 1",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a Alternativo 1';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "Alternativo 2",
                    onSaved: (value) => _formData['Data-Viagem'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a Alternativo 2';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 255, 255, 255))),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Controle de Voo'),
                        content:
                            const Text('Controle de Voo Salvo com sucesso!!'),
                        actions: <Widget>[
                          TextButton(
                              style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text('Confirmar'),
                              onPressed: () {
                                Navigator.of(context).pop;
                              }),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text("Adicionar Controle de voo"),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 255, 255, 255))),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const tela_lista_controlevoo()),
                  );
                },
                child: const Text("Lista de Controle de Voo"))
          ],
        ),
      ),
      bottomNavigationBar: const BarraNavegacao(currentIndex: 0),
    );
  }
}
