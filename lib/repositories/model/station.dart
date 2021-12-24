import 'package:benzapp_flutter/repositories/model/tipo_impianto.dart';
import 'package:floor/floor.dart';

import 'marchio.dart';

@Entity(tableName: 'stations')
class Station {
  Station(this.provincia, this.comune, this.indirizzo, this.longitudine,
      this.latitudine, this.tipo, this.marchio, this.marchioId, this.id);

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? provincia;
  final String comune;
  final String indirizzo;
  final double longitudine;
  final double latitudine;
  final TipoImpianto tipo;
  late final int marchioId;
  final Marchio marchio;

  Station.fromJson(Map<String, dynamic> json)
      : provincia = json['provincia'],
        comune = json['comune'],
        indirizzo = json['indirizzo'],
        longitudine = double.parse(json['longitudine']),
        latitudine = double.parse(json['latitudine']),
        marchioId = int.parse(json['marchio_id']),
        marchio = Marchio.values[int.parse(json['marchio_id'])],
        tipo = TipoImpianto.STRADALE,
        //json['tipo'],
        id = int.parse(json['id']);

  static Map<String, dynamic> fixJsonForDatabase(Map<String, dynamic> json) {
    int marchioId = int.parse(json['marchio_id']);
    json.remove('marchio_id');
    json['marchioId'] = marchioId;
    json['marchio']=Marchio.values[marchioId].name;

    return json;
  }

  Map<String, dynamic> toJson() => {
        'provincia': provincia,
        'comune': comune,
        'indirizzo': indirizzo,
        'longitudine': longitudine,
        'latitudine': latitudine,
        'marchio_id': marchioId,
        'marchio': marchio.name,
        'tipo': tipo,
        'id': id
      };
}
