import 'package:appaviao/entitites/aeroporto_entity.dart';

part 'aeroporto_validate.dart';

class aeroporto_dto with aeroporto_validade {
  int? idaeroporto;
  String codigo_aero;
  String nome_aero;
  String twr_aero;
  String solo_aero;
  String cabeceira_aero;
  String fir_aero;
  String metragem_pista;
  String patio_aero;

  aeroporto_dto({
    this.idaeroporto,
    this.codigo_aero = '',
    this.nome_aero = '',
    this.twr_aero = '',
    this.solo_aero = '',
    this.cabeceira_aero = '',
    this.fir_aero = '',
    this.metragem_pista = '',
    this.patio_aero = '',
  });

  // Method to convert from DTO to Entity
  AeroportoEntity toEntity() {
    return AeroportoEntity(
      idaeroporto: idaeroporto ?? 0,
      codigo_aero: codigo_aero,
      nome_aero: nome_aero,
      twr_aero: twr_aero,
      solo_aero: solo_aero,
      cabeceira_aero: cabeceira_aero,
      fir_aero: fir_aero,
      metragem_pista: metragem_pista,
      patio_aero: patio_aero,
    );
  }

  // Method to convert from JSON to DTO
  factory aeroporto_dto.fromJson(Map<String, dynamic> json) {
    return aeroporto_dto(
      idaeroporto: json['idaeroporto'] ?? 0,
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

  // Method to convert from DTO to Map
  Map<String, dynamic> toMap() {
    return {
      'idaeroporto': idaeroporto,
      'codigo_aero': codigo_aero,
      'nome_aero': nome_aero,
      'twr_aero': twr_aero,
      'solo_aero': solo_aero,
      'cabeceira_aero': cabeceira_aero,
      'fir_aero': fir_aero,
      'metragem_pista': metragem_pista,
      'patio_aero': patio_aero,
    };
  }

  @override
  String toString() {
    return 'aeroporto_dto(idaeroporto: $idaeroporto, codigo_aero: $codigo_aero, nome_aero: $nome_aero, twr_aero: $twr_aero, solo_aero: $solo_aero, cabeceira_aero: $cabeceira_aero, fir_aero: $fir_aero, metragem_pista: $metragem_pista, patio_aero: $patio_aero)';
  }

  void validate() {
    codigoAeroValidate(codigo_aero);
    nomeAeroValidate(nome_aero);
    twrAeroValidate(twr_aero);
    soloAeroValidate(solo_aero);
    cabeceiraAeroValidate(cabeceira_aero);
    firAeroValidate(fir_aero);
    metragemPistaValidate(metragem_pista);
    patioAeroValidate(patio_aero);
  }
}
