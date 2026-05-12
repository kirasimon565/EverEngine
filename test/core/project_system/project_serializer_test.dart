import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/project_system/project.dart';
import 'package:everengine/core/project_system/project_serializer.dart';

void main() {
  group('ProjectSerializer', () {
    test('serialize and deserialize project', () {
      final project = Project(
        name: 'My Game',
        packageName: 'com.test.game',
        engineVersion: '1.0.0',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        projectDir: '/tmp/test_project',
      );

      final json = ProjectSerializer.serialize(project);
      final deserialized = ProjectSerializer.deserialize(json);

      expect(deserialized.name, equals(project.name));
      expect(deserialized.packageName, equals(project.packageName));
      expect(deserialized.projectDir, equals(project.projectDir));
    });
  });
}
