import 'package:path/path.dart' as p;

class Project {
  final String name;
  final String packageName;
  final String version;
  final int versionCode;
  final String orientation;
  final String template;
  final String engineVersion;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String projectDir;
  final List<String> sceneOrder;
  final Map<String, String> metadata;

  const Project({
    required this.name,
    required this.packageName,
    this.version = '1.0.0',
    this.versionCode = 1,
    this.orientation = 'auto',
    this.template = 'blank',
    this.engineVersion = '1.0.0',
    required this.createdAt,
    required this.updatedAt,
    required this.projectDir,
    this.sceneOrder = const [],
    this.metadata = const {},
  });

  String get scenesDir => p.join(projectDir, 'scenes');
  String get assetsDir => p.join(projectDir, 'assets');
  String get variablesFile => p.join(projectDir, 'variables', 'vars.json');
  String get charactersFile =>
      p.join(projectDir, 'characters', 'characters.json');
  String get scriptsDir => p.join(projectDir, 'scripts');
  String get exportProfilesDir => p.join(projectDir, 'export_profiles');
  String get exportsDir => p.join(projectDir, 'exports');

  Project copyWith({
    String? name,
    String? packageName,
    String? version,
    int? versionCode,
    String? orientation,
    String? template,
    String? engineVersion,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? projectDir,
    List<String>? sceneOrder,
    Map<String, String>? metadata,
  }) {
    return Project(
      name: name ?? this.name,
      packageName: packageName ?? this.packageName,
      version: version ?? this.version,
      versionCode: versionCode ?? this.versionCode,
      orientation: orientation ?? this.orientation,
      template: template ?? this.template,
      engineVersion: engineVersion ?? this.engineVersion,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      projectDir: projectDir ?? this.projectDir,
      sceneOrder: sceneOrder ?? List.from(this.sceneOrder),
      metadata: metadata ?? Map.from(this.metadata),
    );
  }
}
