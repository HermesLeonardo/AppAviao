import 'package:appaviao/entitites/trecho_entity.dart';

class adapter_trecho {
  adapter_trecho._();

  static TrechoEntity fromJson(Map<String, dynamic> json) {
    return TrechoEntity(
      idtrecho: json['idtrecho'] ?? '',
      de_trecho: json['de_trecho'] ?? '',
      para_trecho: json['para_trecho'] ?? '',
      trecho_trecho: json['trecho_trecho'] ?? '',
      proa_trecho: json['proa_trecho'] ?? '',
      dist_trecho: json['dist_trecho'] ?? '',
      corredor_trecho: json['corredor_trecho'] ?? '',
      altCorredor_trecho: json['altCorredor_trecho'] ?? '',
      frequencia_trecho: json['frequencia_trecho'] ?? '',
      frequenciaAlter_trecho: json['frequenciaAlter_trecho'] ?? '',
    );
  }

  static Map<String, dynamic> toJson(TrechoEntity model) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idtrecho'] = model.idtrecho;
    data['de_trecho'] = model.de_trecho;
    data['para_trecho'] = model.para_trecho;
    data['trecho_trecho'] = model.trecho_trecho;
    data['proa_trecho'] = model.proa_trecho;
    data['dist_trecho'] = model.dist_trecho;
    data['corredor_trecho'] = model.corredor_trecho;
    data['altCorredor_trecho'] = model.altCorredor_trecho;
    data['frequencia_trecho'] = model.frequencia_trecho;
    data['frequenciaAlter_trecho'] = model.frequenciaAlter_trecho;
    return data;
  }
}
