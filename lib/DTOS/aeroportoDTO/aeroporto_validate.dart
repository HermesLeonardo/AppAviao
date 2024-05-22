part of 'aeroporto_dto.dart';

mixin class aeroporto_validade {
// Validação para codigo_aero
  String? codigoAeroValidate(String codigoAero) {
    if (codigoAero.isEmpty) {
      return 'O código do aeroporto não pode ser vazio';
    }
    return null;
  }

  // Validação para nome_aero
  String? nomeAeroValidate(String nomeAero) {
    if (nomeAero.isEmpty) {
      return 'O nome do aeroporto não pode ser vazio';
    }
    return null;
  }

  // Validação para twr_aero
  String? twrAeroValidate(String twrAero) {
    if (twrAero.isEmpty) {
      return 'O TWR do aeroporto não pode ser vazio';
    }
    return null;
  }

  // Validação para solo_aero
  String? soloAeroValidate(String soloAero) {
    if (soloAero.isEmpty) {
      return 'O solo do aeroporto não pode ser vazio';
    }
    return null;
  }

  // Validação para cabeceira_aero
  String? cabeceiraAeroValidate(String cabeceiraAero) {
    if (cabeceiraAero.isEmpty) {
      return 'A cabeceira do aeroporto não pode ser vazia';
    }
    return null;
  }

  // Validação para fir_aero
  String? firAeroValidate(String firAero) {
    if (firAero.isEmpty) {
      return 'O FIR do aeroporto não pode ser vazio';
    }
    return null;
  }

  // Validação para metragem_pista
  String? metragemPistaValidate(String metragemPista) {
    if (metragemPista.isEmpty) {
      return 'A metragem da pista não pode ser vazia';
    }
    return null;
  }

  // Validação para patio_aero
  String? patioAeroValidate(String patioAero) {
    if (patioAero.isEmpty) {
      return 'O pátio do aeroporto não pode ser vazio';
    }
    return null;
  }
}
