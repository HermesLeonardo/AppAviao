import 'package:appaviao/listagem_trecho/listagem_trecho.dart';
import 'package:flutter/material.dart';
import 'package:appaviao/DTOS/trechoDTO/trecho_dto.dart';
import 'package:appaviao/classes_dao/trecho_dao.dart';
import 'package:flutter/widgets.dart';

class EditarTrechoScreen extends StatefulWidget {
  final trecho_dto trecho;

  const EditarTrechoScreen({super.key, required this.trecho});

  @override
  _EditarTrechoScreenState createState() => _EditarTrechoScreenState();
}

class _EditarTrechoScreenState extends State<EditarTrechoScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _deController;
  late TextEditingController _paraController;
  late TextEditingController _trechoController;
  late TextEditingController _proaController;
  late TextEditingController _distController;
  late TextEditingController _corredorController;
  late TextEditingController _altCorredorController;
  late TextEditingController _frequenciaController;
  late TextEditingController _frequenciaAlterController;

  bool _editing = false;

  @override
  void initState() {
    super.initState();
    _deController = TextEditingController(text: widget.trecho.de_trecho);
    _paraController =
        TextEditingController(text: widget.trecho.para_trecho);
    _trechoController = TextEditingController(text: widget.trecho.trecho_trecho);
    _proaController = TextEditingController(text: widget.trecho.proa_trecho);
    _distController =
        TextEditingController(text: widget.trecho.dist_trecho);
    _corredorController = TextEditingController(text: widget.trecho.corredor_trecho);
    _altCorredorController =
        TextEditingController(text: widget.trecho.altCorredor_trecho);
    _frequenciaController = TextEditingController(text: widget.trecho.frequencia_trecho);
    _frequenciaAlterController = TextEditingController(text: widget.trecho.frequenciaAlter_trecho);
  }

  void _toggleEditing() {
    setState(() {
      _editing = !_editing;
    });
  }

  void _saveTrecho() async {
    if (_formKey.currentState!.validate()) {
      trecho_dto updatedTrecho = trecho_dto(
        idtrecho: widget.trecho.idtrecho,
        de_trecho: _deController.text,
        para_trecho: _paraController.text,
        trecho_trecho: _trechoController.text,
        proa_trecho: _proaController.text,
        dist_trecho: _distController.text,
        corredor_trecho: _corredorController.text,
        altCorredor_trecho: _altCorredorController.text,
        frequencia_trecho: _frequenciaController.text,
        frequenciaAlter_trecho: _frequenciaAlterController.text,
      );

      await trecho_dao().updateTrecho(updatedTrecho);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _deController.dispose();
    _paraController.dispose();
    _trechoController.dispose();
    _proaController.dispose();
    _distController.dispose();
    _corredorController.dispose();
    _altCorredorController.dispose();
    _frequenciaController.dispose();
    _frequenciaAlterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Visualizar Trecho Cadastrado"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child:SingleChildScrollView(
          child: Column(
            children: [
              _buildTextFormField(
                controller: _deController,
                labelText: "De",
              ),
              _buildTextFormField(
                controller: _paraController,
                labelText: "Para",
              ),
              _buildTextFormField(
                controller: _trechoController,
                labelText: "Trecho",
              ),
              _buildTextFormField(
                controller: _proaController,
                labelText: "Proa",
              ),
              _buildTextFormField(
                controller: _distController,
                labelText: "Dist",
              ),
              _buildTextFormField(
                controller: _corredorController,
                labelText: "Corredor",
              ),
              _buildTextFormField(
                controller: _altCorredorController,
                labelText: "Corredor",
              ),
              _buildTextFormField(
                controller: _frequenciaController,
                labelText: "Frequencia",
              ),
              _buildTextFormField(
                controller: _frequenciaAlterController,
                labelText: "Frequencia Alternativa",
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _saveTrecho,
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
                              builder: (context) => const listagem_trecho()));
                    },
                    child: const Text("Voltar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      )
    );
  }

  Widget _buildTextFormField(
      {required TextEditingController controller, required String labelText}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8.0),
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
