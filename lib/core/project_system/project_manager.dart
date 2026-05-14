import 'dart:io';
import 'project.dart';
import 'project_serializer.dart';
import '../utils/file_utils.dart';

class ProjectManager {
  final Directory projectsRootDir;

  ProjectManager(this.projectsRootDir);

  Future<List<Project>> getRecentProjects({int limit = 20}) async {
    if (!await projectsRootDir.exists()) return [];

    final List<Project> projects = [];
    final dirs = projectsRootDir.listSync().whereType<Directory>();

    for (final dir in dirs) {
      try {
        final project = await ProjectSerializer.loadProjectFile(dir.path);
        projects.add(project);
      } catch (e) {
        // Skip invalid projects
      }
    }

    projects.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return projects.take(limit).toList();
  }

  Future<Project> createProject({
    required String name,
    required String packageName,
    String template = 'blank',
    String orientation = 'portrait',
  }) async {
    final projectDirName =
        name.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_').toLowerCase();
    final projectDir = '${projectsRootDir.path}/$projectDirName';

    await FileUtils.ensureDirectory('$projectDir/scenes');
    await FileUtils.ensureDirectory('$projectDir/assets/images');
    await FileUtils.ensureDirectory('$projectDir/assets/audio');
    await FileUtils.ensureDirectory('$projectDir/assets/fonts');
    await FileUtils.ensureDirectory('$projectDir/assets/videos');
    await FileUtils.ensureDirectory('$projectDir/variables');
    await FileUtils.ensureDirectory('$projectDir/characters');
    await FileUtils.ensureDirectory('$projectDir/scripts');
    await FileUtils.ensureDirectory('$projectDir/export_profiles');
    await FileUtils.ensureDirectory('$projectDir/exports');

    final project = Project(
      name: name,
      packageName: packageName,
      template: template,
      orientation: orientation,
      engineVersion: '1.0.0', // In a real app, get this dynamically
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      projectDir: projectDir,
    );

    await ProjectSerializer.saveProjectFile(project);
    return project;
  }

  Future<Project> openProject(String projectDir) async {
    return await ProjectSerializer.loadProjectFile(projectDir);
  }

  Future<void> saveProject(Project project) async {
    final updatedProject = project.copyWith(updatedAt: DateTime.now());
    await ProjectSerializer.saveProjectFile(updatedProject);
  }

  Future<void> closeProject(Project project) async {
    // Save state, close scenes, etc.
  }

  Future<void> deleteProject(Project project) async {
    await FileUtils.deleteDirectory(project.projectDir);
  }

  Future<Project> duplicateProject(Project project, String newName) async {
    final newDirName =
        newName.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_').toLowerCase();
    final newDir = '${projectsRootDir.path}/$newDirName';

    await FileUtils.copyDirectory(project.projectDir, newDir);

    final duplicatedProject = project.copyWith(
      name: newName,
      projectDir: newDir,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await ProjectSerializer.saveProjectFile(duplicatedProject);
    return duplicatedProject;
  }

  Future<void> renameProject(Project project, String newName) async {
    final updatedProject =
        project.copyWith(name: newName, updatedAt: DateTime.now());
    await ProjectSerializer.saveProjectFile(updatedProject);
  }

  Future<String> getTotalProjectSize(Project project) async {
    final size = await FileUtils.directorySize(project.projectDir);
    // Convert to readable format
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(2)} KB';
    return '${(size / (1024 * 1024)).toStringAsFixed(2)} MB';
  }

  Future<bool> validateProject(Project project) async {
    // Check if critical files/directories exist
    final dir = Directory(project.projectDir);
    if (!await dir.exists()) return false;

    final projectFile = File('${project.projectDir}/project.json');
    if (!await projectFile.exists()) return false;

    return true;
  }
}
