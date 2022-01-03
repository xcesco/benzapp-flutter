// dao/person_dao.dart

import 'package:benzapp_flutter/repositories/model/notification.dart';
import 'package:floor/floor.dart';

@dao
abstract class NotificationDao {
  @Query('SELECT * FROM notifications')
  Stream<List<Notification>> findAllLive();

  @Query('SELECT * FROM notifications')
  Stream<List<Notification>> findAll();

  @Query("DELETE FROM notifications")
  Future<void> deleteAll();

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<int> insert(Notification value);

  @Query('SELECT count(*) FROM notifications')
  Future<int?> findCount();
}
