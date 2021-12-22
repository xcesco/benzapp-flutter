class TesseraSummary {
  final double _spesa;
  final double _litriErogati;
  final double _risparmio;

  double get spesa => _spesa;

  TesseraSummary(this._spesa, this._litriErogati, this._risparmio);

  double get litriErogati => _litriErogati;

  double get risparmio => _risparmio;
}
