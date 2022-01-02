import 'package:benzapp_flutter/repositories/model/notification.dart';
import 'package:benzapp_flutter/repositories/notification_repository.dart';

import '../persistence/app_database.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final AppDatabase _database;

  NotificationRepositoryImpl(this._database);

  @override
  Future<void> update() {
    throw UnimplementedError();
  }

  @override
  Future<List<Notification>> getData() {
    throw UnimplementedError();
  }
}
