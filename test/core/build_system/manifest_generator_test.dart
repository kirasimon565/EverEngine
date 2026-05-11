import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/build_system/project_assembler/manifest_generator.dart';
import 'package:everengine/build_system/build_config.dart';
import 'package:everengine/models/export_profile.dart';

void main() {
  group('ManifestGenerator', () {
    test('generateManifest includes package name', () {
      final generator = ManifestGenerator();
      final config = BuildConfig(
        exportConfig:
            ExportConfig(appName: 'test', packageName: 'com.test.app'),
        projectDir: '',
        tempDir: '',
        hasCustomScripts: false,
      );

      final manifest = generator.generateManifest(config);
      expect(manifest.contains('package="com.test.app"'), isTrue);
    });
  });
}
