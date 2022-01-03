import 'package:floor/floor.dart';

import 'base_entity.dart';

@Entity(tableName: 'notifications')
class Notification extends BaseEntity {
  Notification(this.messaggio, {this.targa, int? id}) : super(id = id);

  final String messaggio;

  final String? targa;
}
