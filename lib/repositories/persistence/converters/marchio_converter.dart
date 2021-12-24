import 'package:benzapp_flutter/repositories/model/marchio.dart';
import 'package:floor/floor.dart';

class MarchioConverter extends TypeConverter<Marchio, String> {
  @override
  Marchio decode(String databaseValue) {
    final Marchio result = Marchio.values.firstWhere(
        (e) => e.toString() == databaseValue,
        orElse: () => Marchio.notDefined);
    return result;
  }

  @override
  String encode(Marchio value) {
    return value.toString();
  }
}
