import 'package:benzapp_flutter/repositories/network/model/tessera.dart';
import 'package:floor/floor.dart';

class TesseraCarburanteEnumConverter
    extends TypeConverter<TesseraCarburanteEnum, String> {
  @override
  TesseraCarburanteEnum decode(String databaseValue) {
    return TesseraCarburanteEnum.valueOf(databaseValue);
  }

  @override
  String encode(TesseraCarburanteEnum value) {
    return value.toString();
  }
}
