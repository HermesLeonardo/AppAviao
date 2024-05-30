part of 'trecho_dto.dart';

mixin class trecho_validade {
// Validação para de_trecho
  String? deTrechoValidate(String deTrecho) {
    if (deTrecho.isEmpty) {
      return 'A origem não pode ser vazia';
    }
    return null;
  }

  // Validação para para_trecho
  String? paraTrechoValidate(String paraTrecho) {
    if (paraTrecho.isEmpty) {
      return 'O destino não pode ser vazio';
    }
    return null;
  }

  // Validação para trecho_trecho
  String? trechoTrechoValidate(String trechoTrecho) {
    if (trechoTrecho.isEmpty) {
      return 'O trecho não pode ser vazio';
    }
    return null;
  }

  // Validação para proa_trecho
  String? proaTrechoValidate(String proaTrecho) {
    if (proaTrecho.isEmpty) {
      return 'A proa não pode ser vazia';
    }
    return null;
  }

  // Validação para dist_trecho
  String? distTrechoValidate(String distTrecho) {
    if (distTrecho.isEmpty) {
      return 'A dist não pode ser vazia';
    }
    return null;
  }

  // Validação para corredor_trecho
  String? corredorTrechoValidate(String corredorTrecho) {
    if (corredorTrecho.isEmpty) {
      return 'O corredor não pode ser vazio';
    }
    return null;
  }

  // Validação para altCorredor_trecho
  String? altCorredorTrechoValidate(String altCorredorTrecho) {
    if (altCorredorTrecho.isEmpty) {
      return 'A altura do corredor não pode ser vazio';
    }
    return null;
  }

  // Validação para frequencia_trecho
  String? frequenciaTrechoValidate(String frequenciaTrecho) {
    if (frequenciaTrecho.isEmpty) {
      return 'A frequência não pode ser vazia';
    }
    return null;
  }

  // Validação para frequenciaAlter_trecho
  String? frequenciaAlterTrechoValidate(String frequenciaAlterTrecho) {
    if (frequenciaAlterTrecho.isEmpty) {
      return 'A frequência alternativa não pode ser vazia';
    }
    return null;
  }
}
