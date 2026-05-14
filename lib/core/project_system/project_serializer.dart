import 'dart:convert';
import 'dart:io';
import 'package:archive/archive_io.dart';
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
      'projectDir': project.projectDir,
      'sceneOrder': project.sceneOrder,
      'metadata': project.metadata,
    };
  }

  static Project deserialize(Map<String, dynamic> json) {
    return Project(
      name: json['name'] as String,
      packageName: json['packageName'] as String,
      version: json['version'] as String? ?? "1.0.0",
      versionCode: json['versionCode'] as int? ?? 1,
      orientation: json['orientation'] as String? ?? "portrait",
      template: json['template'] as String? ?? "blank",
      engineVersion: json['engineVersion'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      projectDir: json['projectDir'] as String,
      sceneOrder: (json['sceneOrder'] as List<dynamic>? ?? []).cast<String>(),
      metadata: (json['metadata'] as Map<String, dynamic>? ?? {}).map(
        (k, v) => MapEntry(k, v as String),
      ),
    );
  }

  static Future<void> saveProjectFile(Project project) async {
    final file = File('${project.projectDir}/project.json');
    final jsonString = jsonEncode(serialize(project));
    await file.writeAsString(jsonString);
  }

  static Future<Project> loadProjectFile(String dirPath) async {
    final file = File('$dirPath/project.json');
    final jsonString = await file.readAsString();
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return deserialize(jsonMap);
  }

  static Future<void> exportToEve(Project project, String outputPath) async {
    final encoder = ZipFileEncoder();
    encoder.create(outputPath);
    encoder.addDirectory(Directory(project.projectDir));
    encoder.close();
  }

  static Future<Project> importFromEve(String evePath, String targetDir) async {
    final bytes = File(evePath).readAsBytesSync();
    final archive = ZipDecoder().decodeBytes(bytes);

    for (final file in archive) {
      final filename = file.name;
      if (file.isFile) {
        final data = file.content as List<int>;
        File('$targetDir/$filename')
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory('$targetDir/$filename').createSync(recursive: true);
      }
    }

    return await loadProjectFile(targetDir);
  }
}
