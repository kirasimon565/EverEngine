import 'dart:convert';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:path/path.dart' as p;
import 'project.dart';

class ProjectSerializer {
  static Map<String, dynamic> serialize(Project project) {
    return {
      'name': project.name,
      'packageName': project.packageName,
      'version': project.version,
      'versionCode': project.versionCode,
      'orientation': project.orientation,
      'template': project.template,
      'engineVersion': project.engineVersion,
      'createdAt': project.createdAt.toIso8601String(),
      'updatedAt': project.updatedAt.toIso8601String(),
      'sceneOrder': project.sceneOrder,
      'metadata': project.metadata,
    };
  }

  static Project deserialize(Map<String, dynamic> json, String projectDir) {
    return Project(
      name: json['name'] as String,
      packageName: json['packageName'] as String,
      version: json['version'] as String? ?? '1.0.0',
      versionCode: json['versionCode'] as int? ?? 1,
      orientation: json['orientation'] as String? ?? 'auto',
      template: json['template'] as String? ?? 'blank',
      engineVersion: json['engineVersion'] as String? ?? '1.0.0',
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      projectDir: projectDir,
      sceneOrder: (json['sceneOrder'] as List?)?.cast<String>() ?? [],
      metadata: (json['metadata'] as Map<String, dynamic>?)
              ?.map((k, v) => MapEntry(k, v.toString())) ??
          {},
    );
  }

  static Future<void> saveProjectFile(Project project) async {
    final file = File(p.join(project.projectDir, 'project.json'));
    final jsonString = jsonEncode(serialize(project));
    await file.writeAsString(jsonString);
  }

  static Future<Project> loadProjectFile(String dirPath) async {
    final file = File(p.join(dirPath, 'project.json'));
    final jsonString = await file.readAsString();
    final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
    return deserialize(jsonData, dirPath);
  }

  static Future<void> exportToEve(Project project, String outputPath) async {
    var encoder = ZipFileEncoder();
    encoder.create(outputPath);
    encoder.addDirectory(Directory(project.projectDir));
    encoder.close();
  }

  static Future<Project> importFromEve(String evePath, String targetDir) async {
    final bytes = await File(evePath).readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    for (final file in archive) {
      final filename = file.name;
      if (file.isFile) {
        final data = file.content as List<int>;
        final outFile = File(p.join(targetDir, filename));
        await outFile.create(recursive: true);
        await outFile.writeAsBytes(data);
      } else {
        await Directory(p.join(targetDir, filename)).create(recursive: true);
      }
    }

    return loadProjectFile(targetDir);
  }
}
