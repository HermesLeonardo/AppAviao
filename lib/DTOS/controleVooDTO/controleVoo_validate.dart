part of 'controleVoo_dto.dart';

mixin class controleVoo_validate {
  String? dataViagemValidate(String dataViagem) {
    if (dataViagem.isEmpty) {
      return 'Data Vaigem está vazio';
    }
    return null;
  }

  String? nomeViagemValidate(String nomeViagem) {
    if (nomeViagem.isEmpty) {
      return 'Nome da Viagem está vazio';
    }
    return null;
  }

  String? controleValidate(String controle) {
    if (controle.isEmpty) {
      return 'Controle está vazio';
    }
    return null;
  }

  String? latValidate(String lat) {
    if (lat.isEmpty) {
      return 'Lat está vazio';
    }
    return null;
  }

  String? lagValidate(String lag) {
    if (lag.isEmpty) {
      return 'Lag está vazio';
    }
    return null;
  }

  String? longValidat(String Long) {
    if (Long.isEmpty) {
      return 'Long está vazio';
    }
    return null;
  }

  String? qmh_localValidate(String qmhLocal) {
    if (qmhLocal.isEmpty) {
      return 'QMH Local está vazio';
    }
    return null;
  }

  String? qmh_destinoValidate(String qmhdestino) {
    if (qmhdestino.isEmpty) {
      return 'QMH Destino está vazio';
    }
    return null;
  }

  String? radioValidate(String radio) {
    if (radio.isEmpty) {
      return 'Rádio está vazio';
    }
    return null;
  }

  String? transpoinder_1Validate(String transpoinder1) {
    if (transpoinder1.isEmpty) {
      return 'Transponder 1 está vazio';
    }
    return null;
  }

  String? transponder_emergenciaValidate(String transponderemergencia) {
    if (transponderemergencia.isEmpty) {
      return 'Transponder de Emergência está vazio';
    }
    return null;
  }

  String? elevacao_localValidate(String elevacaolocal) {
    if (elevacaolocal.isEmpty) {
      return 'Elevação local está vazio';
    }
    return null;
  }

  String? elevacao_destinoValidate(String elevacaodestino) {
    if (elevacaodestino.isEmpty) {
      return 'Elevação do Destino está vazio';
    }
    return null;
  }

  String? altitude_obrigatorioValidate(String altitudeobrigatorio) {
    if (altitudeobrigatorio.isEmpty) {
      return 'Altitude está vazio';
    }
    return null;
  }

  String? tempo_voo_estimadoValidate(String tempovooestimado) {
    if (tempovooestimado.isEmpty) {
      return 'Tempo de Voo Estimado está vazio';
    }
    return null;
  }

  String? alternativo_1Validate(String alternativo1) {
    if (alternativo1.isEmpty) {
      return 'Alternativo 1 está vazio';
    }
    return null;
  }

  String? alternativo_2Validate(String alternativo2) {
    if (alternativo2.isEmpty) {
      return 'Alternativo 2 está vazio';
    }
    return null;
  }
}
