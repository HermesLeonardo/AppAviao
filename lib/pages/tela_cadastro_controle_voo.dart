import 'package:appaviao/Custons/custom_tela_controle_voo/custom_from_text_field_controle_voo.dart';
import 'package:flutter/material.dart';

class tela_cadastro_controle_voo extends StatefulWidget {
  const tela_cadastro_controle_voo({super.key});

  @override
  State<tela_cadastro_controle_voo> createState() =>
      _tela_cadastro_controle_vooState();
}

class _tela_cadastro_controle_vooState
    extends State<tela_cadastro_controle_voo> {
  final _formKey = GlobalKey<FormState>();

  void _addControleVoo() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 48, 73),
        appBar: AppBar(
          title: const Text(
            "Controle de Voo",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: const <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "Data da Viagem",
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "AERONAVE",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "Viagem",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "Controle",
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "Lat",
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "Long",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "QNH Local",
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "QNH Dest",
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "QNH Rádio",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "Transponder de Emergência",
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "Tranponder 1",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "Elevação destino",
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "Elevação local",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "Tempo de Voo Esti",
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "Altitude Obrigatoria",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "Alternativo 1",
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: custom_from_text_field_controle_voo(
                      labelText: "Alternativo 2",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 255, 255))),
                  onPressed: null,
                  child: Text("Adicionar Controle de voo"))
            ],
          ),
        ));
  }
}
