class controleVooEntity {
  final int idcontroleVoo;
  final String dataViagem;
  final String nomeViagem;
  final String controle;
  final String lat;
  final String lag;
  final String long;
  final String qmh_local;
  final String qmh_destino;
  final String radio;
  final String transponder_1;
  final String transponder_emergencia;
  final String elevacao_local;
  final String elevacao_destino;
  final String altitude_obrigatorio;
  final String tempo_voo_estimado;
  final String alternativo_1;
  final String alternativo_2;

  controleVooEntity({
    required this.idcontroleVoo,
    required this.dataViagem,
    required this.nomeViagem,
    required this.controle,
    required this.lat,
    required this.lag,
    required this.long,
    required this.qmh_local,
    required this.qmh_destino,
    required this.radio,
    required this.transponder_1,
    required this.transponder_emergencia,
    required this.elevacao_local,
    required this.elevacao_destino,
    required this.altitude_obrigatorio,
    required this.tempo_voo_estimado,
    required this.alternativo_1,
    required this.alternativo_2,
  });
}
