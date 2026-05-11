import 'dart:io';
import 'package:path/path.dart' as p;
import '../../core/project_system/project.dart';
import '../build_config.dart';

class FlutterProjectAssembler {
  Future<String> assembleProject(Project project, BuildConfig config) async {
    final tempDir = Directory(config.tempDir);
    await tempDir.create(recursive: true);

    // Write pubspec.yaml
    final pubspecFile = File(p.join(tempDir.path, 'pubspec.yaml'));
    await pubspecFile.writeAsString('''
name: \${config.exportConfig.packageName.replaceAll('.', '_')}
description: "\${config.exportConfig.appName}"
version: 1.0.0+1
environment:
  sdk: '>=3.0.0 <4.0.0'
dependencies:
  flutter:
    sdk: flutter
flutter:
  uses-material-design: true
''');

    // Make android dirs
    final androidAppMainSrcDir =
        Directory(p.join(tempDir.path, 'android', 'app', 'src', 'main'));
    await androidAppMainSrcDir.create(recursive: true);

    // We skip actual copying logic for the minimal test for now
    // In a real implementation this copies all assets, nodes, etc.

    return tempDir.path;
  }
}
