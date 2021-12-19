class Station {
  String id;
  String marchio_id;
  String indirizzo;
  String comune;
  double longitudine;
  double latitudine;
  String tipo;

  Station(this.id, this.marchio_id, this.indirizzo, this.comune,
      this.longitudine, this.latitudine, this.tipo);

  factory Station.fromJson(dynamic json) {
    return Station(
        json['id'],
        json['marchio_id'],
        json['indirizzo'],
        json['comune'],
        double.parse(json['longitudine']),
        double.parse(json['latitudine']),
        json['tipo']);
  }
}
