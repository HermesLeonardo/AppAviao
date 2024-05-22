import 'package:appaviao/entitites/aeroporto_entity.dart';

class adapter_aeroporto {
  adapter_aeroporto._();

  static AeroportoEntity fromJson(Map<String, dynamic> json) {
    return AeroportoEntity(
      idaeroporto: json['idaeroporto'] ?? '',
      codigo_aero: json['codigo_aero'] ?? '',
      nome_aero: json['nome_aero'] ?? '',
      twr_aero: json['twr_aero'] ?? '',
      solo_aero: json['solo_aero'] ?? '',
      cabeceira_aero: json['cabeceira_aero'] ?? '',
      fir_aero: json['fir_aero'] ?? '',
      metragem_pista: json['metragem_pista'] ?? '',
      patio_aero: json['patio_aero'] ?? '',
    );
  }

  static Map<String, dynamic> toJson(AeroportoEntity model) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idaeroporto'] = model.idaeroporto;
    data['codigo_aero'] = model.codigo_aero;
    data['nome_aero'] = model.nome_aero;
    data['twr_aero'] = model.twr_aero;
    data['solo_aero'] = model.solo_aero;
    data['cabeceira_aero'] = model.cabeceira_aero;
    data['fir_aero'] = model.fir_aero;
    data['metragem_pista'] = model.metragem_pista;
    data['patio_aero'] = model.patio_aero;
    return data;
  }
}
