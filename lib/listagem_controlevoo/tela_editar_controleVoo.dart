import 'package:appaviao/DTOS/controleVooDTO/controleVoo_dto.dart';
import 'package:appaviao/classes_dao/controleVoo_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditarControleVoo extends StatefulWidget {
  final controleVoo_dto controleVoo;

  const EditarControleVoo({super.key, required this.controleVoo});

  @override
  State<EditarControleVoo> createState() => _EditarControleVooState();
}

class _EditarControleVooState extends State<EditarControleVoo> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _dataViagemController;
  late TextEditingController _nomeViagemController;
  late TextEditingController _controleContrller;
  late TextEditingController _lagController;
  late TextEditingController _latController;
  late TextEditingController _longController;
  late TextEditingController _qmh_localController;
  late TextEditingController _qmh_destinoController;
  late TextEditingController _radioController;
  late TextEditingController _alternativo_1Controller;
  late TextEditingController _alternativo_2Controller;
  late TextEditingController _altitude_obrigatorioController;
  late TextEditingController _elevacao_localController;
  late TextEditingController _elevacao_destinoController;
  late TextEditingController _tempo_voo_estimadoController;
  late TextEditingController _transponder_1Controller;
  late TextEditingController _transponder_emergenciaController;

  bool _editing = false;

  @override
  void initState() {
    super.initState();

    _dataViagemController =
        TextEditingController(text: widget.controleVoo.dataViagem);
    _nomeViagemController =
        TextEditingController(text: widget.controleVoo.nomeViagem);
    _controleContrller =
        TextEditingController(text: widget.controleVoo.controle);
    _lagController = TextEditingController(text: widget.controleVoo.lag);
    _latController = TextEditingController(text: widget.controleVoo.lat);
    _longController = TextEditingController(text: widget.controleVoo.long);
    _qmh_localController =
        TextEditingController(text: widget.controleVoo.qmh_local);
    _qmh_destinoController =
        TextEditingController(text: widget.controleVoo.qmh_destino);
    _radioController = TextEditingController(text: widget.controleVoo.radio);
    _alternativo_1Controller =
        TextEditingController(text: widget.controleVoo.alternativo_1);
    _alternativo_2Controller =
        TextEditingController(text: widget.controleVoo.alternativo_2);
    _altitude_obrigatorioController =
        TextEditingController(text: widget.controleVoo.altitude_obrigatorio);
    _elevacao_localController =
        TextEditingController(text: widget.controleVoo.elevacao_local);
    _elevacao_destinoController =
        TextEditingController(text: widget.controleVoo.elevacao_destino);
    _tempo_voo_estimadoController =
        TextEditingController(text: widget.controleVoo.tempo_voo_estimado);
    _transponder_1Controller =
        TextEditingController(text: widget.controleVoo.transponder_1);
    _transponder_emergenciaController =
        TextEditingController(text: widget.controleVoo.transponder_emergencia);
  }

  void _toggleEditing() {
    setState(() {
      _editing = !_editing;
    });
  }

  void _saveControleVoo() async {
    if (_formKey.currentState!.validate()) {
      controleVoo_dto updateContoleVoo = controleVoo_dto(
        idcontroleVoo: widget.controleVoo.idcontroleVoo,
        nomeViagem: widget.controleVoo.nomeViagem,
        dataViagem: widget.controleVoo.dataViagem,
        controle: widget.controleVoo.controle,
        lag: widget.controleVoo.lag,
        lat: widget.controleVoo.lat,
        long: widget.controleVoo.long,
        qmh_local: widget.controleVoo.qmh_local,
        qmh_destino: widget.controleVoo.qmh_destino,
        radio: widget.controleVoo.radio,
        alternativo_1: widget.controleVoo.alternativo_1,
        alternativo_2: widget.controleVoo.alternativo_2,
        altitude_obrigatorio: widget.controleVoo.altitude_obrigatorio,
        elevacao_local: widget.controleVoo.elevacao_local,
        elevacao_destino: widget.controleVoo.elevacao_destino,
        tempo_voo_estimado: widget.controleVoo.tempo_voo_estimado,
        transponder_1: widget.controleVoo.transponder_1,
        transponder_emergencia: widget.controleVoo.transponder_emergencia,
      );

      await controleVoo_dao().updateControleVoo(updateContoleVoo);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _dataViagemController.dispose();
    _nomeViagemController.dispose();
    _controleContrller.dispose();
    _lagController.dispose();
    _latController.dispose();
    _longController.dispose();
    _qmh_localController.dispose();
    _qmh_destinoController.dispose();
    _radioController.dispose();
    _alternativo_1Controller.dispose();
    _alternativo_2Controller.dispose();
    _altitude_obrigatorioController.dispose();
    _elevacao_localController.dispose();
    _elevacao_destinoController.dispose();
    _tempo_voo_estimadoController.dispose();
    _transponder_1Controller.dispose();
    _transponder_emergenciaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TEste"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTextFormField(
                  controller: _dataViagemController,
                  labelText: "Data Viagem",
                ),
                _buildTextFormField(
                  controller: _nomeViagemController,
                  labelText: "Nome Viagem",
                ),
                _buildTextFormField(
                  controller: _controleContrller,
                  labelText: "Controle",
                ),
                _buildTextFormField(
                  controller: _lagController,
                  labelText: "Lag",
                ),
                _buildTextFormField(
                  controller: _latController,
                  labelText: "Lat",
                ),
                _buildTextFormField(
                  controller: _longController,
                  labelText: "Long",
                ),
                _buildTextFormField(
                  controller: _qmh_localController,
                  labelText: "QMH LOCAL",
                ),
                _buildTextFormField(
                  controller: _qmh_destinoController,
                  labelText: "QMH DESTINO",
                ),
                _buildTextFormField(
                  controller: _radioController,
                  labelText: "radio",
                ),
                _buildTextFormField(
                  controller: _alternativo_1Controller,
                  labelText: "alternativo 1",
                ),
                _buildTextFormField(
                  controller: _alternativo_2Controller,
                  labelText: "alternativo 2",
                ),
                _buildTextFormField(
                  controller: _altitude_obrigatorioController,
                  labelText: "ALTITUDE OBRIGATORIA",
                ),
                _buildTextFormField(
                  controller: _elevacao_localController,
                  labelText: "Elevação LOCAL",
                ),
                _buildTextFormField(
                  controller: _elevacao_destinoController,
                  labelText: "Elevação Destino",
                ),
                _buildTextFormField(
                  controller: _tempo_voo_estimadoController,
                  labelText: "Tempo de Voo Estimado",
                ),
                _buildTextFormField(
                  controller: _transponder_1Controller,
                  labelText: "Transponder 1",
                ),
                _buildTextFormField(
                  controller: _transponder_emergenciaController,
                  labelText: "Transponder de Emergencia",
                ),
              ],
            )
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(
      {required TextEditingController controller, required String labelText}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 247, 6, 6)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16)),
        readOnly: !_editing,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Insira o item que falta: $labelText';
          }
          return null;
        },
      ),
    );
  }
}
