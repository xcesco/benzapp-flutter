import 'package:package_info_plus/package_info_plus.dart';

import '../application_info_repository.dart';

class ApplicationInfoRepositoryImpl implements ApplicationInfoRepository {
  @override
  Future<void> init() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }

  @override
  late String appName;

  @override
  late String buildNumber;

  @override
  late String packageName;

  @override
  late String version;
}
