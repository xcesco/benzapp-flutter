import 'package:benzapp_flutter/network/model/gestore.dart';
import 'package:benzapp_flutter/network/model/tessera.dart';
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
