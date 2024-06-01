import 'package:appaviao/Custons/custom_tela_controle_voo/custom_from_text_field_controlevoo.dart';
import 'package:appaviao/listagem_controlevoo/tela_lista_controlevoo.dart';
import 'package:appaviao/pages/barra_navegacao.dart';
import 'package:flutter/material.dart';
import '../Custons/custom_tela_controle_voo/caixa_info_widget_controlevoo.dart';
import '../DTOS/controleVooDTO/controleVoo_dto.dart';

class TelaCadastroControleVoo extends StatefulWidget {
  const TelaCadastroControleVoo({super.key});

  @override
  State<TelaCadastroControleVoo> createState() =>
      _TelaCadastroControleVooState();
}

class _TelaCadastroControleVooState extends State<TelaCadastroControleVoo> {
  final _formKey = GlobalKey<FormState>();
  final dataViagemController = TextEditingController();
  final nomeViagemController = TextEditingController();
  final controleController = TextEditingController();
  final latController = TextEditingController();
  final lagController = TextEditingController();
  final longController = TextEditingController();
  final qmhLocalController = TextEditingController();
  final qmhDestinoController = TextEditingController();
  final radioController = TextEditingController();
  final alternativo1Controller = TextEditingController();
  final alternativo2Controller = TextEditingController();
  final altitudeObrigatorioController = TextEditingController();
  final elevacaoLocalController = TextEditingController();
  final elevacaoDestinoController = TextEditingController();
  final tempoVooEstimadoController = TextEditingController();
  final transponder1Controller = TextEditingController();
  final transponderEmergenciaController = TextEditingController();

  void _inserirControlevoo() {
    final controlevoo = controleVoo_dto(
      dataViagem: dataViagemController.text,
      nomeViagem: nomeViagemController.text,
      controle: controleController.text,
      lat: latController.text,
      lag: lagController.text,
      Long: longController.text,
      qmh_local: qmhLocalController.text,
      qmh_destino: qmhDestinoController.text,
      radio: radioController.text,
      alternativo_1: alternativo1Controller.text,
      alternativo_2: alternativo2Controller.text,
      altitude_obrigatorio: altitudeObrigatorioController.text,
      elevacao_local: elevacaoLocalController.text,
      elevacao_destino: elevacaoDestinoController.text,
      tempo_voo_estimado: tempoVooEstimadoController.text,
      transponder_1: transponder1Controller.text,
      transponder_emergencia: transponderEmergenciaController.text,
    );

    // Add the logic to handle the created 'controlevoo' object, e.g., save it to a database or send it to an API.
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
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            custom_from_text_field_controle_voo(
              labelText: "Data da Viagem",
              controller: dataViagemController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a data da viagem';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            custom_from_text_field_controle_voo(
              labelText: "Nome da Viagem",
              controller: nomeViagemController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o nome da viagem';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
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
                const SizedBox(width: 5),
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "QMH Local",
                    controller: qmhLocalController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o QMH Local';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "QMH Dest",
                    controller: qmhDestinoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o QMH Dest';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "Lat",
                    controller: latController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a Latitude';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: custom_from_text_field_controle_voo(
                    labelText: "Long",
                    controller: longController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a Longitude';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            custom_from_text_field_controle_voo(
              labelText: "Lag",
              controller: lagController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o Lag';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            custom_from_text_field_controle_voo(
              labelText: "Transponder de Emergência",
              controller: transponderEmergenciaController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o Transponder de Emergência';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            custom_from_text_field_controle_voo(
              labelText: "Transponder 1",
              controller: transponder1Controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o Transponder 1';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            custom_from_text_field_controle_voo(
              labelText: "Elevação Local",
              controller: elevacaoLocalController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a Elevação Local';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            custom_from_text_field_controle_voo(
              labelText: "Elevação Destino",
              controller: elevacaoDestinoController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a Elevação Destino';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            custom_from_text_field_controle_voo(
              labelText: "Tempo de Voo Estimado",
              controller: tempoVooEstimadoController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o Tempo de Voo Estimado';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            custom_from_text_field_controle_voo(
              labelText: "Altitude Obrigatória",
              controller: altitudeObrigatorioController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a Altitude Obrigatória';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            custom_from_text_field_controle_voo(
              labelText: "Alternativo 1",
              controller: alternativo1Controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o Alternativo 1';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            custom_from_text_field_controle_voo(
              labelText: "Alternativo 2",
              controller: alternativo2Controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o Alternativo 2';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 0, 0, 255), // Changed backgroundColor to blue
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _inserirControlevoo();
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Controle de Voo'),
                        content:
                            const Text('Controle de Voo salvo com sucesso!'),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
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
              child: const Text("Adicionar Controle de Voo"),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 0, 0, 255), // Changed backgroundColor to blue
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const tela_lista_controlevoo()),
                );
              },
              child: const Text("Lista de Controle de Voo"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BarraNavegacao(currentIndex: 0),
    );
  }
}
