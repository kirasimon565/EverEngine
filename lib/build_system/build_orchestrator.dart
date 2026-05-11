import '../core/project_system/project.dart';
import '../models/export_profile.dart';
import '../models/build_result.dart';
import 'minimal_runtime/minimal_exporter.dart';
import 'sdk/sdk_locator.dart';
import 'compiler/flutter_build_runner.dart';

class BuildOrchestrator {
  final MinimalExporter _minimalExporter = MinimalExporter();
  final FlutterBuildRunner _fullBuildRunner = FlutterBuildRunner();

  Future<BuildResult> build(Project project, ExportConfig config,
      {bool hasCustomDart = false}) async {
    if (!hasCustomDart) {
      return _minimalExporter.exportMinimal(project, config);
    } else {
      final sdk = await SdkLocator.findFlutterSdk();
      if (sdk == null) {
        return const BuildResult(
            success: false,
            errorMessage: 'Flutter SDK not found',
            durationMs: 0);
      }
      return _fullBuildRunner.buildApk(project.projectDir, sdk, config);
    }
  }
}
