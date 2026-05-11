import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:everengine/state/state.dart';
import 'package:everengine/core/project_system/project.dart';

void main() {
  group('ProjectNotifier', () {
    test('createProject adds to recent projects', () async {
      final container = ProviderContainer();
      final notifier = container.read(projectProvider.notifier);

      final project = Project(
        name: 'Test',
        packageName: 'com.test',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        projectDir: '/test',
      );

      await notifier.createProject(project);

      final state = container.read(projectProvider);
      expect(state.currentProject, equals(project));
      expect(state.recentProjects.contains(project), isTrue);
    });

    test('closeProject clears current project', () async {
      final container = ProviderContainer();
      final notifier = container.read(projectProvider.notifier);

      final project = Project(
        name: 'Test',
        packageName: 'com.test',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        projectDir: '/test',
      );

      await notifier.createProject(project);
      await notifier.closeProject();

      final state = container.read(projectProvider);
      expect(state.currentProject, isNull);
    });
  });
}
