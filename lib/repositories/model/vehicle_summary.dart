import 'package:floor/floor.dart';

@DatabaseView(
    'SELECT targa, SUM((prezzoAlLitro-sconto)*litriErogati) as spesa, SUM(litriErogati) as litriErogati, SUM(sconto*litriErogati) as risparmio FROM refuelings GROUP BY targa',
    viewName: 'vehicle_summaries')
class VehicleSummary {
  final double spesa;
  final double litriErogati;
  final double risparmio;
  final String targa;

  VehicleSummary(this.spesa, this.litriErogati, this.risparmio, this.targa);
}
