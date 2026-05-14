import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/state/project_state.dart';
import 'package:everengine/core/project_system/project.dart';

void main() {
  group('ProjectNotifier', () {
    test('loadRecentProjects populates list (mocked)', () async {
      final notifier = ProjectNotifier();
      await notifier.loadRecentProjects();
      expect(notifier.state.isLoading, isFalse);
    });

    test('createProject adds to recent projects', () async {
      final notifier = ProjectNotifier();
      final project = Project(
          name: 'Test',
          packageName: 'com.test',
          engineVersion: '1.0.0',
          projectDir: '/tmp',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      await notifier.createProject(project);
      expect(notifier.state.recentProjects.length, equals(1));
      expect(notifier.state.currentProject, equals(project));
    });

    test('closeProject clears current project', () async {
      final notifier = ProjectNotifier();
      final project = Project(
          name: 'Test',
          packageName: 'com.test',
          engineVersion: '1.0.0',
          projectDir: '/tmp',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      await notifier.createProject(project);
      await notifier.closeProject();
      expect(notifier.state.currentProject, isNull);
    });

    test('deleteProject removes from list', () async {
      final notifier = ProjectNotifier();
      final project = Project(
          name: 'Test',
          packageName: 'com.test',
          engineVersion: '1.0.0',
          projectDir: '/tmp',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      await notifier.createProject(project);
      await notifier.deleteProject(project);
      expect(notifier.state.recentProjects.isEmpty, isTrue);
    });
  });
}
