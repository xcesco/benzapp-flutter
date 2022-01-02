import 'package:benzapp_flutter/repositories/network/model/rifornimento.dart';
import 'package:floor/floor.dart';

class RifornimentoTipoCarburanteEnumConverter
    extends TypeConverter<RifornimentoTipoCarburanteEnum, String> {
  @override
  RifornimentoTipoCarburanteEnum decode(String databaseValue) {
    return RifornimentoTipoCarburanteEnum.valueOf(databaseValue);
  }

  @override
  String encode(RifornimentoTipoCarburanteEnum value) {
    return value.toString();
  }
}
