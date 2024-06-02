import 'package:appaviao/entitites/controleVoo_entity.dart';

class adapter_controleVoo {
  adapter_controleVoo._();

  static controleVooEntity fromJson(Map<String, dynamic> json) {
    return controleVooEntity(
      idcontroleVoo: json['idcontroleVoo'] ?? '',
      dataViagem: json['dataviagem'] ?? '',
      nomeViagem: json['nomeViagem'] ?? '',
      controle: json['controle'] ?? '',
      lat: json['lat'] ?? '',
      lag: json['lag'] ?? '',
      long: json['Long'] ?? '',
      qmh_local: json['qmh_local'] ?? '',
      qmh_destino: json['qmh_destino'] ?? '',
      radio: json['radio'] ?? '',
      transponder_1: json['transpoinder_1'] ?? '',
      transponder_emergencia: json['transponder_emergencia'] ?? '',
      elevacao_local: json['elevacao_local'] ?? '',
      elevacao_destino: json['elevacao_destino'] ?? '',
      altitude_obrigatorio: json['altitude_obrigatorio'] ?? '',
      tempo_voo_estimado: json['tempo_voo_estimado'] ?? '',
      alternativo_1: json['alternativo_1'] ?? '',
      alternativo_2: json['alternativo_2'] ?? '',
    );
  }

  static Map<String, dynamic> toJson(controleVooEntity model) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idcontroleVoo'] = model.idcontroleVoo;
    data['dataViagem'] = model.dataViagem;
    data['nomeViagem'] = model.nomeViagem;
    data['controle'] = model.controle;
    data['lat'] = model.lat;
    data['lag'] = model.lag;
    data['long'] = model.long;
    data['qmh_local'] = model.qmh_local;
    data['qmh_destino'] = model.qmh_destino;
    data['radio'] = model.radio;
    data['transponder_1'] = model.transponder_1;
    data['transponder_emergencia'] = model.transponder_emergencia;
    data['elevacao_local'] = model.elevacao_local;
    data['elevacao_destino'] = model.elevacao_destino;
    data['altitude_obrigatorio'] = model.altitude_obrigatorio;
    data['tempo_voo_estimado'] = model.tempo_voo_estimado;
    data['alternativo_1'] = model.alternativo_1;
    data['alternativo_2'] = model.alternativo_2;
    return data;
  }
}
