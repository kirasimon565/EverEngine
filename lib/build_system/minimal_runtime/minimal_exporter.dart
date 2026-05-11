import 'dart:io';
import 'package:path/path.dart' as p;
import '../../core/project_system/project.dart';
import '../../models/export_profile.dart';
import '../../models/build_result.dart';
import '../build_config.dart';
import '../project_assembler/flutter_project_assembler.dart';
import 'apk_packager.dart';
import '../signer/apk_signer.dart';

class MinimalExporter {
  final FlutterProjectAssembler _assembler = FlutterProjectAssembler();
  final ApkPackager _packager = ApkPackager();
  final ApkSigner _signer = ApkSigner();

  Future<BuildResult> exportMinimal(
      Project project, ExportConfig exportConfig) async {
    final sw = Stopwatch()..start();
    try {
      final config = BuildConfig(
        exportConfig: exportConfig,
        projectDir: project.projectDir,
        tempDir: p.join(Directory.systemTemp.path,
            'everengine_build_\${DateTime.now().millisecondsSinceEpoch}'),
        hasCustomScripts: false,
      );

      final assembledDir = await _assembler.assembleProject(project, config);
      final unsignedApk = await _packager.packageApk(
          assembledDir, config.exportConfig.targetAbis);
      final signedApk =
          await _signer.signApk(unsignedApk, config.exportConfig.keystore);

      final outDir = Directory(project.exportsDir);
      await outDir.create(recursive: true);

      final finalPath = p.join(outDir.path, '\${exportConfig.appName}.apk');
      await signedApk.copy(finalPath);

      // Cleanup temp
      await Directory(assembledDir).delete(recursive: true);

      sw.stop();
      return BuildResult(
        success: true,
        outputPath: finalPath,
        durationMs: sw.elapsedMilliseconds,
      );
    } catch (e, stack) {
      sw.stop();
      return BuildResult(
        success: false,
        errorMessage: e.toString(),
        logs: stack.toString(),
        durationMs: sw.elapsedMilliseconds,
      );
    }
  }
}
