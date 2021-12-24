import 'package:floor/floor.dart';

abstract class BaseEntity {
  BaseEntity(this.id);

  @PrimaryKey(autoGenerate: true)
  final int? id;
}
