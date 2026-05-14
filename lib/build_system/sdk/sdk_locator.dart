
class SdkConfig {
  final String path;
  final String version;
  final String dartVersion;
  final String channel;
  final bool isValid;

  const SdkConfig({
    required this.path,
    required this.version,
    required this.dartVersion,
    required this.channel,
    required this.isValid,
  });
}

class SdkLocator {
  static Future<SdkConfig?> findFlutterSdk() async {
    // Mock implementation for finding Flutter SDK
    return const SdkConfig(
      path: '/mock/flutter',
      version: '3.43.0',
      dartVersion: '3.12.0',
      channel: 'stable',
      isValid: true,
    );
  }
}
