import 'package:floor/floor.dart';

@dao
abstract class TransactionalDao {
  @transaction
  Future<void> executeUpdate() async {}
}
