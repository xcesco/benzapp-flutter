import 'package:benzapp_flutter/repositories/network/model/cittadino.dart';
import 'package:floor/floor.dart';

import '../../../serializers.dart';

class CittadinoConverter extends TypeConverter<Cittadino, String> {
  @override
  Cittadino decode(String databaseValue) {
    return standardSerializers.fromJson(Cittadino.serializer, databaseValue)!;
  }

  @override
  String encode(Cittadino value) {
    return standardSerializers.toJson(Cittadino.serializer, value);
  }
}
