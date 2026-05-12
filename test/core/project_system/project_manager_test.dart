import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/project_system/project_manager.dart';

void main() {
  late Directory tempDir;
  late ProjectManager manager;

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('everengine_test_');
    manager = ProjectManager(tempDir);
  });

  tearDown(() {
    tempDir.deleteSync(recursive: true);
  });

  group('ProjectManager', () {
    test('createProject creates directory structure', () async {
      final project = await manager.createProject(
        name: 'Test Game',
        packageName: 'com.test.game',
      );

      expect(Directory('${project.projectDir}/scenes').existsSync(), isTrue);
      expect(Directory('${project.projectDir}/assets/images').existsSync(), isTrue);
      expect(File('${project.projectDir}/project.json').existsSync(), isTrue);
    });

    test('deleteProject removes all files', () async {
      final project = await manager.createProject(
        name: 'Delete Game',
        packageName: 'com.test.game',
      );

      expect(Directory(project.projectDir).existsSync(), isTrue);

      await manager.deleteProject(project);

      expect(Directory(project.projectDir).existsSync(), isFalse);
    });

    test('validateProject returns true for valid project', () async {
      final project = await manager.createProject(
        name: 'Valid Game',
        packageName: 'com.test.game',
      );

      expect(await manager.validateProject(project), isTrue);
    });
  });
}
