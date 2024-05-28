import 'package:appaviao/entitites/controleVoo_entity.dart';

part 'controleVoo_validate.dart';

class controleVoo_dto with controleVoo_validate {
  DateTime? dataViagem;
  String controle;
  String lat;
  String lag;
  String Long;
  String qmh_local;
  String qmh_destino;
  String radio;

  controleVoo_dto({
    this.dataViagem,
    this.controle = '',
    this.lat = '',
    this.lag = '',
    this.Long = '',
    this.qmh_destino = '',
    this.qmh_local = '',
    this.radio = '',
  });

  controleVooEntity toEntity() {
    return controleVooEntity(
      dataViagem: dataViagem!,
      controle: controle,
      lat: lat,
      lag: lag,
      long: '',
      qmh_local: '',
      qmh_destino: '',
      radio: '',
      transpoinder_1: '',
      transponder_emergencia: '',
      elevacao_local: '',
      elevacao_destino: '',
      altitude_obrigatorio: '',
      tempo_voo_estimado: '',
      alternativo_1: '',
      alternativo_2: '',
    );
  }
}
