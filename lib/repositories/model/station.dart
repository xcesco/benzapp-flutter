import 'package:benzapp_flutter/repositories/model/tipo_impianto.dart';
import 'package:floor/floor.dart';

import 'marchio.dart';

@Entity(tableName: 'stations')
class Station {
  Station(this.provincia, this.comune, this.indirizzo, this.longitudine,
      this.latitudine, this.tipo, this.marchio, this.id);

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String provincia;
  final String comune;
  final String indirizzo;
  final double longitudine;
  final double latitudine;
  final TipoImpianto tipo;
  final Marchio marchio;

  Station.fromJson(Map<String, dynamic> json)
      : provincia = json['provincia'],
        comune = json['comune'],
        indirizzo = json['indirizzo'],
        longitudine = json['longitudine'],
        latitudine = json['latitudine'],
        marchio = json['marchio'],
        tipo = json['tipo'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
        'provincia': provincia,
        'comune': comune,
        'indirizzo': indirizzo,
        'longitudine': longitudine,
        'latitudine': latitudine,
      };
}
