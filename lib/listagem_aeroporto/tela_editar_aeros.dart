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
  late TextEditingController _soloController;
  late TextEditingController _cabeceiraController;
  late TextEditingController _firController;
  late TextEditingController _metragemPistaController;
  late TextEditingController _patioController;

  bool _editing = false;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.aeroporto.nome_aero);
    _codigoController =
        TextEditingController(text: widget.aeroporto.codigo_aero);
    _twrController = TextEditingController(text: widget.aeroporto.twr_aero);
    _soloController = TextEditingController(text: widget.aeroporto.solo_aero);
    _cabeceiraController =
        TextEditingController(text: widget.aeroporto.cabeceira_aero);
    _firController = TextEditingController(text: widget.aeroporto.fir_aero);
    _metragemPistaController =
        TextEditingController(text: widget.aeroporto.metragem_pista);
    _patioController = TextEditingController(text: widget.aeroporto.patio_aero);
  }

  void _toggleEditing() {
    setState(() {
      _editing = !_editing;
    });
  }

  void _saveAeroporto() async {
    if (_formKey.currentState!.validate()) {
      aeroporto_dto updatedAeroporto = aeroporto_dto(
        idaeroporto: widget.aeroporto.idaeroporto,
        nome_aero: _nomeController.text,
        codigo_aero: _codigoController.text,
        twr_aero: _twrController.text,
        solo_aero: _soloController.text,
        cabeceira_aero: _cabeceiraController.text,
        fir_aero: _firController.text,
        metragem_pista: _metragemPistaController.text,
        patio_aero: _patioController.text,
      );

      await aeroporto_dao().updateAeroporto(updatedAeroporto);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _codigoController.dispose();
    _twrController.dispose();
    _soloController.dispose();
    _cabeceiraController.dispose();
    _firController.dispose();
    _metragemPistaController.dispose();
    _patioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Visualizar Aeroporto Cadastrado"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextFormField(
                controller: _nomeController,
                labelText: "Nome",
              ),
              _buildTextFormField(
                controller: _codigoController,
                labelText: "Código",
              ),
              _buildTextFormField(
                controller: _twrController,
                labelText: "TWR",
              ),
              _buildTextFormField(
                controller: _soloController,
                labelText: "SOLO",
              ),
              _buildTextFormField(
                controller: _cabeceiraController,
                labelText: "Cabeceira",
              ),
              _buildTextFormField(
                controller: _firController,
                labelText: "FIR",
              ),
              _buildTextFormField(
                controller: _metragemPistaController,
                labelText: "Metragem",
              ),
              _buildTextFormField(
                controller: _patioController,
                labelText: "Patio",
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _saveAeroporto,
                    child: const Text("Salvar Edição"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _toggleEditing,
                    child: Text(_editing
                        ? 'Bloquear Edição'
                        : 'Desbloquear para Edição'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TesteListagem()));
                    },
                    child: const Text("Voltar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(
      {required TextEditingController controller, required String labelText}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        readOnly: !_editing,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, insira o $labelText';
          }
          return null;
        },
      ),
    );
  }
}
