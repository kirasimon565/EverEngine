import 'keystore_profile.dart';

enum ExportFormat { apk, aab, split }

class ExportConfig {
  final String appName;
  final String packageName;
  final String version;
  final int versionCode;
  final String? appIconPath;
  final List<String> permissions;
  final KeystoreConfig? keystore;
  final ExportFormat format;
  final List<String> targetAbis;
  final int minSdkVersion;
  final int targetSdkVersion;
  final int compileSdkVersion;
  final bool enableProguard;
  final String? customProguardRules;

  const ExportConfig({
    required this.appName,
    required this.packageName,
    this.version = '1.0.0',
    this.versionCode = 1,
    this.appIconPath,
    this.permissions = const ['android.permission.INTERNET'],
    this.keystore,
    this.format = ExportFormat.apk,
    this.targetAbis = const ['armeabi-v7a', 'arm64-v8a', 'x86_64'],
    this.minSdkVersion = 21,
    this.targetSdkVersion = 35,
    this.compileSdkVersion = 35,
    this.enableProguard = true,
    this.customProguardRules,
  });

  Map<String, dynamic> toJson() => {
        'appName': appName,
        'packageName': packageName,
        'version': version,
        'versionCode': versionCode,
        if (appIconPath != null) 'appIconPath': appIconPath,
        'permissions': permissions,
        if (keystore != null) 'keystore': keystore!.toJson(),
        'format': format.name,
        'targetAbis': targetAbis,
        'minSdkVersion': minSdkVersion,
        'targetSdkVersion': targetSdkVersion,
        'compileSdkVersion': compileSdkVersion,
        'enableProguard': enableProguard,
        if (customProguardRules != null)
          'customProguardRules': customProguardRules,
      };

  factory ExportConfig.fromJson(Map<String, dynamic> json) => ExportConfig(
        appName: json['appName'] as String,
        packageName: json['packageName'] as String,
        version: json['version'] as String? ?? '1.0.0',
        versionCode: json['versionCode'] as int? ?? 1,
        appIconPath: json['appIconPath'] as String?,
        permissions: (json['permissions'] as List?)?.cast<String>() ?? [],
        keystore: json['keystore'] != null
            ? KeystoreConfig.fromJson(json['keystore'] as Map<String, dynamic>)
            : null,
        format: ExportFormat.values.byName(json['format'] as String? ?? 'apk'),
        targetAbis: (json['targetAbis'] as List?)?.cast<String>() ??
            ['armeabi-v7a', 'arm64-v8a', 'x86_64'],
        minSdkVersion: json['minSdkVersion'] as int? ?? 21,
        targetSdkVersion: json['targetSdkVersion'] as int? ?? 35,
        compileSdkVersion: json['compileSdkVersion'] as int? ?? 35,
        enableProguard: json['enableProguard'] as bool? ?? true,
        customProguardRules: json['customProguardRules'] as String?,
      );
}
