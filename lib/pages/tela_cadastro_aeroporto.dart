import 'package:appaviao/Custons/Custom_tela_aeroporto/custom_from_text_field_aero.dart';
import 'package:appaviao/DTOS/aeroportoDTO/aeroporto_dto.dart';
import 'package:appaviao/classes_dao/aeroporto_dao.dart';
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

  void _inserirAeroporto(aeroporto_dto aeroporto) {
    aeroporto_dao aerodao = aeroporto_dao();
    aerodao.insertAeroporto(aeroporto);
  }

  Future<List<aeroporto_dto>> listarAero() async {
    aeroporto_dao aerolistdao = aeroporto_dao();
    List<aeroporto_dto> aeroporto = await aerolistdao.selecionarAeroporto();
    return aeroporto;
  }

  late aeroporto_dto aeroporto_ins;



  @override
  Widget build(BuildContext context) {
    aeroporto_ins = aeroporto_dto();
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
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'Codigo',
                    onSaved: (value) => _formData['Codigo'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira do Codigo do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'Cabeceira',
                    onSaved: (value) => _formData['Cabeceira'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a Cabeceira do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'TWR',
                    onSaved: (value) => _formData['TWR'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o TWR do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'Solo',
                    onSaved: (value) => _formData['Solo'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Solo do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'Patio',
                    onSaved: (value) => _formData['Patio'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira do Pátio do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'FIR',
                    onSaved: (value) => _formData['FIR'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira do FIR do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: custom_from_text_field_aero(
                    labelText: 'MetragemPista',
                    onSaved: (value) =>
                        _formData['MetragemPista'] = value ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a MEtragem da pista do aeroporto';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _inserirAeroporto(aeroporto_ins);
                }
              },
              child: const Text("Adicionar Aeroporto"),
            ),
            const SizedBox(height: 10), // Espaço entre os botões
            ElevatedButton(
              onPressed: () {
                listarAero(); // Imprimir no terminal
              },
              child: const Text("Outro Botão"),
            ),
          ],
        ),
      ),
    );
  }
}
