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

  final dataViagemController = TextEditingController();
  final nomeViagemContrelloer = TextEditingController();
  final controleController = TextEditingController();
  final latController = TextEditingController();
  final lagController = TextEditingController();
  final longController = TextEditingController();
  final qmh_localController = TextEditingController();
  final qmh_destinoController = TextEditingController();
  final radioController = TextEditingController();
  final alternativo_1Controller = TextEditingController();
  final alternativo_2Controller = TextEditingController();
  final altitude_obrigatorioController = TextEditingController();
  final elevacao_localController = TextEditingController();
  final elevacao_destinoController = TextEditingController();
  final tempo_voo_estimadoController = TextEditingController();
  final transponder_1Controller = TextEditingController();
  final transponder_emergenciaController = TextEditingController();

  final bool _showInformation = false;

  void _inserirControlevoo() {
    final controlevoo = controleVoo_dto(
      dataViagem: dataViagemController.text,
      nomeViagem: nomeViagemContrelloer.text,
      controle: controleController.text,
      lat: latController.text,
      lag: lagController.text,
      Long: longController.text,
      qmh_local: qmh_localController.text,
      qmh_destino: qmh_destinoController.text,
      radio: radioController.text,
      alternativo_1: alternativo_1Controller.text,
      alternativo_2: alternativo_2Controller.text,
      altitude_obrigatorio: altitude_obrigatorioController.text,
      elevacao_local: elevacao_localController.text,
      elevacao_destino: elevacao_destinoController.text,
      tempo_voo_estimado: tempo_voo_estimadoController.text,
      transponder_1: transponder_1Controller.text,
      transponder_emergencia: transponder_emergenciaController.text,
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
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "Nome da Viagem",
                      controller: nomeViagemContrelloer,
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
                      controller: controleController,
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
                      labelText: "QMH Local",
                      controller: qmh_localController,
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
                      labelText: "QMH Dest",
                      controller: qmh_destinoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o QNH Dest';
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
                      labelText: "Lat",
                      controller: latController,
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
                      controller: longController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o Long';
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
                      labelText: "Lag",
                      controller: lagController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o Lag';
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
                      controller: transponder_emergenciaController,
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
                      controller: transponder_1Controller,
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
                      controller: elevacao_destinoController,
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
                      controller: elevacao_localController,
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
                      controller: tempo_voo_estimadoController,
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
                      controller: altitude_obrigatorioController,
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
                      controller: alternativo_1Controller,
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
                      controller: alternativo_2Controller,
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
                    _inserirControlevoo();
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Controle de Voo'),
                          content: const Text(
                              'Controle de Voo Salvo com sucesso!!!'),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text('Confirmar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
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
        ));
  }
}



//Verificar a necessidade
/*
  void _salvarControledeVoo() {
   if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
     setState(() {
       _showInformation = true;
     });
       print(_formData);
     }
  }

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
  List<ControleVooInfoWidget> controleVooInforWidgets = [];

  //Verificar se for necessário criar um addControleVoo
  
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