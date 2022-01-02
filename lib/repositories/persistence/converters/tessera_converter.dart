import 'package:benzapp_flutter/repositories/network/model/gestore.dart';
import 'package:benzapp_flutter/repositories/network/model/tessera.dart';
import 'package:floor/floor.dart';

import '../../../serializers.dart';

class TesseraConverter extends TypeConverter<Tessera, String> {
  @override
  Tessera decode(String databaseValue) {
    return standardSerializers.fromJson(Tessera.serializer, databaseValue)!;
  }

  @override
  String encode(Tessera value) {
    return standardSerializers.toJson(Tessera.serializer, value);
  }
}
