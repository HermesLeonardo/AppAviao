import 'package:appaviao/listagem_aeroporto/TesteListagem.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/DTOS/aeroportoDTO/aeroporto_dto.dart';
import 'package:appaviao/classes_dao/aeroporto_dao.dart';

class EditarAeroportoScreen extends StatefulWidget {
  final aeroporto_dto aeroporto;

  const EditarAeroportoScreen({super.key, required this.aeroporto});

  @override
  _EditarAeroportoScreenState createState() => _EditarAeroportoScreenState();
}

class _EditarAeroportoScreenState extends State<EditarAeroportoScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _codigoController;
  late TextEditingController _twrController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.aeroporto.nome_aero);
    _codigoController =
        TextEditingController(text: widget.aeroporto.codigo_aero);
  }

  void _saveAeroporto() async {
    if (_formKey.currentState!.validate()) {
      aeroporto_dto updatedAeroporto = aeroporto_dto(
        idaeroporto: widget.aeroporto.idaeroporto,
        nome_aero: _nomeController.text,
        codigo_aero: _codigoController.text,
        twr_aero: _twrController.text,

        // other fields...
      );

      await aeroporto_dao().updateAeroporto(updatedAeroporto);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _codigoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Aeroporto"),
        backgroundColor: const Color.fromARGB(255, 30, 106, 219),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: "Nome"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _codigoController,
                decoration: const InputDecoration(labelText: "Código"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o código';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _codigoController,
                decoration: const InputDecoration(labelText: "Código"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o código';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _saveAeroporto,
                  child: const Text("Salvar"),
                ),
                const SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TesteListagem()));
                  },
                  child: const Text("Voltar"),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
