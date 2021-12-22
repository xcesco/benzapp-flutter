import 'entity.dart';

class Notification extends Entity {
  final _messaggio;

  final _targa;

  Notification(this._targa, this._messaggio, {int id = 0}) : super(id = id);

  get messaggio => _messaggio;

  get targa => _targa;
}
