abstract class EverEnginePlugin {
  String get id;
  String get name;
  String get version;
  String get description;
  String get author;

  Future<void> onInstall() async {}
  Future<void> onUninstall() async {}
}
