import 'package:benzapp_flutter/network/model/gestore.dart';
import 'package:floor/floor.dart';

import '../../../serializers.dart';

class GestoreConverter extends TypeConverter<Gestore, String> {
  @override
  Gestore decode(String databaseValue) {
    return standardSerializers.fromJson(Gestore.serializer, databaseValue)!;
  }

  @override
  String encode(Gestore value) {
    return standardSerializers.toJson(Gestore.serializer, value);
  }
}
