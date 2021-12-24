import 'dart:async';

import 'package:benzapp_flutter/repositories/model/notification.dart';
import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:benzapp_flutter/repositories/model/station.dart';
import 'package:benzapp_flutter/repositories/model/tessera_summary.dart';
import 'package:benzapp_flutter/repositories/model/vehicle.dart';
import 'package:benzapp_flutter/repositories/persistence/converters/cittadino_converter.dart';
import 'package:benzapp_flutter/repositories/persistence/converters/gestore_converter.dart';
import 'package:benzapp_flutter/repositories/persistence/converters/marchio_converter.dart';
import 'package:benzapp_flutter/repositories/persistence/converters/tipo_impianto_converter.dart';
import 'package:benzapp_flutter/repositories/persistence/dao/notification_dao.dart';
import 'package:benzapp_flutter/repositories/persistence/dao/vehicle_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'converters/date_time_converter.dart';
import 'converters/rifornimento_tipo_carburante_enum_converter.dart';
import 'converters/tessera_carburante_enum_converter.dart';
import 'converters/tessera_converter.dart';
import 'converters/tessera_veicolo_enum_converter.dart';
import 'dao/refueling_dao.dart';
import 'dao/station_dao.dart';

part 'app_database.g.dart'; // the generated code will be there

@TypeConverters([
  DateTimeConverter,
  TesseraCarburanteEnumConverter,
  CittadinoConverter,
  TesseraVeicoloEnumConverter,
  GestoreConverter,
  TesseraConverter,
  RifornimentoTipoCarburanteEnumConverter,
  TipoImpiantoConverter,
  MarchioConverter
])
@Database(
    version: 1,
    entities: [Notification, Vehicle, Station, Refueling, TesseraSummary])
abstract class AppDatabase extends FloorDatabase {
  NotificationDao get notificationDao;

  VehicleDao get vehicleDao;

  StationDao get stationDao;

  RefuelingDao get refuelingDao;
}
