import 'package:appaviao/entitites/controleVoo_entity.dart';

part 'controleVoo_validate.dart';

class controleVoo_dto with controleVoo_validate {
  int? idcontroleVoo;
  String dataViagem;
  String controle;
  String lat;
  String lag;
  String Long;
  String qmh_local;
  String qmh_destino;
  String radio;
  String transpoinder_1;
  String transponder_emergencia;
  String elevacao_local;
  String elevacao_destino;
  String altitude_obrigatorio;
  String tempo_voo_estimado;
  String alternativo_1;
  String alternativo_2;

  controleVoo_dto({
    this.idcontroleVoo,
    this.dataViagem = '',
    this.controle = '',
    this.lat = '',
    this.lag = '',
    this.Long = '',
    this.qmh_local = '',
    this.qmh_destino = '',
    this.radio = '',
    this.alternativo_1 = '',
    this.alternativo_2 = '',
    this.altitude_obrigatorio = '',
    this.elevacao_local = '',
    this.elevacao_destino = '',
    this.tempo_voo_estimado = '',
    this.transpoinder_1 = '',
    this.transponder_emergencia = '',
  });

  controleVooEntity toEntity() {
    return controleVooEntity(
      idcontroleVoo: idcontroleVoo ?? 0,
      dataViagem: dataViagem,
      controle: controle,
      lat: lat,
      lag: lag,
      long: Long,
      qmh_local: qmh_local,
      qmh_destino: qmh_destino,
      radio: radio,
      transpoinder_1: transpoinder_1,
      transponder_emergencia: transponder_emergencia,
      elevacao_local: elevacao_local,
      elevacao_destino: elevacao_destino,
      altitude_obrigatorio: altitude_obrigatorio,
      tempo_voo_estimado: tempo_voo_estimado,
      alternativo_1: alternativo_1,
      alternativo_2: alternativo_2,
    );
  }

  factory controleVoo_dto.fromJson(Map<String, dynamic> json) {
    return controleVoo_dto(
      idcontroleVoo: json['idcontroleVoo'] ?? 0,
      dataViagem: json['dataviagem'] ?? '',
      controle: json['controle'] ?? '',
      lat: json['lat'] ?? '',
      lag: json['lag'] ?? '',
      Long: json['Long'] ?? '',
      qmh_local: json['qmh_local'] ?? '',
      qmh_destino: json['qmh_destino'] ?? '',
      radio: json['radio'] ?? '',
      transpoinder_1: json['transpoinder_1'] ?? '',
      transponder_emergencia: json['transponder_emergencia'] ?? '',
      elevacao_local: json['elevacao_local'] ?? '',
      elevacao_destino: json['elevacao_destino'] ?? '',
      altitude_obrigatorio: json['altitude_obrigatorio'] ?? '',
      tempo_voo_estimado: json['tempo_voo_estimado'] ?? '',
      alternativo_1: json['alternativo_1'] ?? '',
      alternativo_2: json['alternativo_2'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idcontroleVoo': idcontroleVoo,
      'dataViagem': dataViagem,
      'controle': controle,
      'lat': lat,
      'lag': lag,
      'Long': Long,
      'qmh_local': qmh_local,
      'qmh_destino': qmh_destino,
      'radio': radio,
      'transpoinder_1': transpoinder_1,
      'transponder_emergencia': transponder_emergencia,
      'elevacao_local': elevacao_local,
      'elevacao_destino': elevacao_destino,
      'altitude_obrigatorio': altitude_obrigatorio,
      'tempo_voo_estimado': tempo_voo_estimado,
      'alternativo_1': alternativo_1,
      'alternativo_2': alternativo_2,
    };
  }

  @override
  String toString() {
    return 'controleVoo_dto(dataViagem: $dataViagem, contole: $controle)';
  }

  void validate() {
    dataViagemValidate(dataViagem);
    controleValidate(controle);
    latValidate(lat);
    lagValidate(lag);
    longValidat(Long);
    qmh_localValidate(qmh_local);
    qmh_destinoValidate(qmh_destino);
    radioValidate(radio);
    transpoinder_1Validate(transpoinder_1);
    transponder_emergenciaValidate(transponder_emergencia);
    elevacao_localValidate(elevacao_local);
    elevacao_destinoValidate(elevacao_destino);
    altitude_obrigatorioValidate(altitude_obrigatorio);
    tempo_voo_estimadoValidate(tempo_voo_estimado);
    alternativo_1Validate(alternativo_1);
    alternativo_2Validate(alternativo_2);
  }
}
