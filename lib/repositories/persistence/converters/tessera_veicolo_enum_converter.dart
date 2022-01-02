import 'package:benzapp_flutter/repositories/network/model/tessera.dart';
import 'package:floor/floor.dart';

class TesseraVeicoloEnumConverter
    extends TypeConverter<TesseraVeicoloEnum, String> {
  @override
  TesseraVeicoloEnum decode(String databaseValue) {
    return TesseraVeicoloEnum.valueOf(databaseValue);
  }

  @override
  String encode(TesseraVeicoloEnum value) {
    return value.toString();
  }
}
