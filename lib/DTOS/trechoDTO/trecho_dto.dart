import 'package:appaviao/entitites/trecho_entity.dart';

part 'trecho_validate.dart';

class trecho_dto with trecho_validade {
  int? idtrecho;
  String de_trecho;
  String para_trecho;
  String trecho_trecho;
  String proa_trecho;
  String dist_trecho;
  String corredor_trecho;
  String altCorredor_trecho;
  String frequencia_trecho;
  String frequenciaAlter_trecho;

  trecho_dto({
    this.idtrecho,
    this.de_trecho = '',
    this.para_trecho = '',
    this.trecho_trecho = '',
    this.proa_trecho = '',
    this.dist_trecho = '',
    this.corredor_trecho = '',
    this.altCorredor_trecho = '',
    this.frequencia_trecho = '',
    this.frequenciaAlter_trecho = '',
  });

  // Method to convert from DTO to Entity
  TrechoEntity toEntity() {
    return TrechoEntity(
      idtrecho: idtrecho ?? 0,
      de_trecho: de_trecho,
      para_trecho: para_trecho,
      trecho_trecho: trecho_trecho,
      proa_trecho: proa_trecho,
      dist_trecho: dist_trecho,
      corredor_trecho: corredor_trecho,
      altCorredor_trecho: altCorredor_trecho,
      frequencia_trecho: frequencia_trecho,
      frequenciaAlter_trecho: frequenciaAlter_trecho,
    );
  }

  // Method to convert from JSON to DTO
  factory trecho_dto.fromJson(Map<String, dynamic> json) {
    return trecho_dto(
      idtrecho: json['idtrecho'] ?? 0,
      de_trecho: json['de_trecho'] ?? '',
      para_trecho: json['para_trecho'] ?? '',
      trecho_trecho: json['trecho_trecho'] ?? '',
      proa_trecho: json['proa_trecho'] ?? '',
      dist_trecho: json['dist_trecho'] ?? '',
      corredor_trecho: json['fir_aero'] ?? '',
      altCorredor_trecho: json['altCorredor_trecho'] ?? '',
      frequencia_trecho: json['frequencia_trecho'] ?? '',
      frequenciaAlter_trecho: json['frequenciaAlter_trecho'] ?? '',
    );
  }

  // Method to convert from DTO to Map
  Map<String, dynamic> toMap() {
    return {
      'idtrecho': idtrecho,
      'de_trecho': de_trecho,
      'para_trecho': para_trecho,
      'trecho_trecho': trecho_trecho,
      'proa_trecho': proa_trecho,
      'dist_trecho': dist_trecho,
      'corredor_trecho': corredor_trecho,
      'altCorredor_trecho': altCorredor_trecho,
      'frequencia_trecho': frequencia_trecho,
      'frequenciaAlter_trecho': frequenciaAlter_trecho,
    };
  }

  @override
  String toString() {
    return 'aeroporto_dto(idtrecho: $idtrecho, de_trecho: $de_trecho, para_trecho: $para_trecho, trecho_trecho: $trecho_trecho, proa_trecho: $proa_trecho, dist_trecho: $dist_trecho, corredor_trecho: $corredor_trecho, altCorredor_trecho: $altCorredor_trecho, frequencia_trecho: $frequencia_trecho, frequenciaAlter_trecho: $frequenciaAlter_trecho)';
  }

  void validate() {
    deTrechoValidate(de_trecho);
    paraTrechoValidate(para_trecho);
    trechoTrechoValidate(trecho_trecho);
    proaTrechoValidate(proa_trecho);
    distTrechoValidate(dist_trecho);
    corredorTrechoValidate(corredor_trecho);
    altCorredorTrechoValidate(altCorredor_trecho);
    frequenciaTrechoValidate(frequencia_trecho);
    frequenciaAlterTrechoValidate(frequenciaAlter_trecho);
  }
}
