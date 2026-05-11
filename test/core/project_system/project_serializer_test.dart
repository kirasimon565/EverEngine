import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/project_system/project.dart';
import 'package:everengine/core/project_system/project_serializer.dart';

void main() {
  group('ProjectSerializer', () {
    test('serialize and deserialize project', () {
      final project = Project(
        name: 'Test Game',
        packageName: 'com.test.game',
        projectDir: '/test/dir',
        createdAt: DateTime(2023),
        updatedAt: DateTime(2023),
      );

      final json = ProjectSerializer.serialize(project);
      final deserialized = ProjectSerializer.deserialize(json, '/test/dir');

      expect(deserialized.name, equals('Test Game'));
      expect(deserialized.packageName, equals('com.test.game'));
      expect(deserialized.projectDir, equals('/test/dir'));
    });
  });
}
