import 'package:floor/floor.dart';

import 'base_entity.dart';

@Entity(tableName: 'notifications')
class Notification extends BaseEntity {
  Notification(int id, this.messaggio, this.targa) : super(id);

  final String messaggio;

  final String targa;
}
