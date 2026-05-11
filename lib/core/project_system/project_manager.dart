import 'dart:io';
import 'package:path/path.dart' as p;
import 'project.dart';
import 'project_serializer.dart';
import '../utils/file_utils.dart';

class ProjectManager {
  final Directory projectsRootDir;

  ProjectManager(this.projectsRootDir);

  Future<List<Project>> getRecentProjects({int limit = 20}) async {
    final projects = <Project>[];
    if (await projectsRootDir.exists()) {
      await for (final entity in projectsRootDir.list()) {
        if (entity is Directory) {
          try {
            final project =
                await ProjectSerializer.loadProjectFile(entity.path);
            projects.add(project);
          } catch (e) {
            // Skip invalid project directories
          }
        }
      }
    }
    projects.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return projects.take(limit).toList();
  }

  Future<Project> createProject({
    required String name,
    required String packageName,
    String template = 'blank',
    String orientation = 'auto',
  }) async {
    final projectDir = p.join(projectsRootDir.path, name);
    await FileUtils.ensureDirectory(projectDir);

    final dirsToCreate = [
      'scenes',
      'assets/images',
      'assets/audio',
      'assets/fonts',
      'assets/videos',
      'variables',
      'characters',
      'scripts',
      'export_profiles',
      'exports',
    ];

    for (final dir in dirsToCreate) {
      await FileUtils.ensureDirectory(p.join(projectDir, dir));
    }

    final project = Project(
      name: name,
      packageName: packageName,
      template: template,
      orientation: orientation,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      projectDir: projectDir,
    );

    await ProjectSerializer.saveProjectFile(project);
    return project;
  }

  Future<Project> openProject(String projectDir) async {
    return ProjectSerializer.loadProjectFile(projectDir);
  }

  Future<void> saveProject(Project project) async {
    final updated = project.copyWith(updatedAt: DateTime.now());
    await ProjectSerializer.saveProjectFile(updated);
  }

  Future<void> closeProject(Project project) async {
    // simplified
  }

  Future<void> deleteProject(Project project) async {
    await FileUtils.deleteDirectory(project.projectDir);
  }

  Future<Project> duplicateProject(Project project, String newName) async {
    final newDir = p.join(projectsRootDir.path, newName);
    await FileUtils.copyDirectory(project.projectDir, newDir);

    final newProject = project.copyWith(
      name: newName,
      projectDir: newDir,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await ProjectSerializer.saveProjectFile(newProject);
    return newProject;
  }

  Future<void> renameProject(Project project, String newName) async {
    // simplified - would normally need to rename directory and update project.json
  }

  Future<String> getTotalProjectSize(Project project) async {
    final size = await FileUtils.directorySize(project.projectDir);
    return '${(size / (1024 * 1024)).toStringAsFixed(2)} MB';
  }

  Future<bool> validateProject(Project project) async {
    return true; // placeholder
  }
}
