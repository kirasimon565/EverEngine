import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/build_system/project_assembler/gradle_generator.dart';
import 'package:everengine/build_system/build_config.dart';
import 'package:everengine/models/export_profile.dart';

void main() {
  group('GradleGenerator', () {
    test('generate functions return strings', () {
      final generator = GradleGenerator();
      final config = BuildConfig(
        exportConfig: ExportConfig(appName: 'test', packageName: 'com.test'),
        projectDir: '',
        tempDir: '',
        hasCustomScripts: false,
      );

      expect(generator.generateRootBuildGradle(config), isNotEmpty);
      expect(generator.generateAppBuildGradle(config), isNotEmpty);
      expect(generator.generateSettingsGradle(config), isNotEmpty);
    });
  });
}
