import 'package:floor/floor.dart';

@entity
class TesseraSummary {
  @PrimaryKey()
  final int? id;
  final double spesa;
  final double litriErogati;
  final double risparmio;

  TesseraSummary(this.spesa, this.litriErogati, this.risparmio, {this.id});
}
