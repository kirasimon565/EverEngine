import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/build_system/project_assembler/flutter_project_assembler.dart';
import 'package:everengine/build_system/build_config.dart';
import 'package:everengine/models/export_profile.dart';
import 'package:everengine/core/project_system/project.dart';

void main() {
  group('FlutterProjectAssembler', () {
    test('assembleProject creates structure', () async {
      final assembler = FlutterProjectAssembler();
      final tempDir =
          Directory.systemTemp.createTempSync('assembler_test').path;

      final project = Project(
          name: 'Test',
          packageName: 'com.test',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          projectDir: '');
      final config = BuildConfig(
        exportConfig:
            ExportConfig(appName: 'test', packageName: 'com.test.app'),
        projectDir: '',
        tempDir: tempDir,
        hasCustomScripts: false,
      );

      final outDir = await assembler.assembleProject(project, config);
      expect(Directory(outDir).existsSync(), isTrue);
      expect(File('\$outDir/pubspec.yaml').existsSync(), isTrue);
    });
  });
}
