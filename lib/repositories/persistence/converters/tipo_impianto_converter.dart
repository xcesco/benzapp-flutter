import 'package:benzapp_flutter/repositories/model/tipo_impianto.dart';
import 'package:floor/floor.dart';

class TipoImpiantoConverter extends TypeConverter<TipoImpianto, String> {
  @override
  TipoImpianto decode(String databaseValue) {
    final TipoImpianto result = TipoImpianto.values.firstWhere(
        (e) => e.toString() == databaseValue,
        orElse: () => TipoImpianto.STRADALE);
    return result;
  }

  @override
  String encode(TipoImpianto value) {
    return value.toString();
  }
}
