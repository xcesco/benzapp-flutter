import 'package:benzapp_flutter/repositories/model/notification.dart';

import 'abstract_repository.dart';

abstract class NotificationRepository extends AbstractRepository<Notification> {
  Stream<List<Notification>> getDataStream();

  Future<void> deleteAll() async {}
}
