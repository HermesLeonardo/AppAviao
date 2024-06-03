import 'package:flutter/material.dart';

class ControleVooInfoWidget extends StatelessWidget {
  final String dataviagem;
  final String nomeViagem;
  final String controle;
  final String lat;
  final String long;
  final String QNHlocal;
  final String QNHdest;
  final String radio;
  final String tranponderdeemergencia;
  final String tranponder1;
  final String elevacaodestino;
  final String elevacaolocal;
  final String tempovooesti;
  final String altitudeobrigatorio;
  final String alternativo_1;
  final String alternativo_2;

  const ControleVooInfoWidget({
    super.key,
    required this.dataviagem,
    required this.nomeViagem,
    required this.controle,
    required this.lat,
    required this.long,
    required this.QNHlocal,
    required this.QNHdest,
    required this.radio,
    required this.tranponderdeemergencia,
    required this.tranponder1,
    required this.elevacaodestino,
    required this.elevacaolocal,
    required this.tempovooesti,
    required this.altitudeobrigatorio,
    required this.alternativo_1,
    required this.alternativo_2,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
