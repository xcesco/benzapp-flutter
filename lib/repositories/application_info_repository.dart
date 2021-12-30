abstract class ApplicationInfoRepository {
  late String appName;
  late String packageName;
  late String version;
  late String buildNumber;

  Future<void> init();
}
