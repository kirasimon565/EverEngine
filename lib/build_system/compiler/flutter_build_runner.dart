import '../sdk/sdk_locator.dart';
import '../../models/export_profile.dart';
import '../../models/build_result.dart';

class FlutterBuildRunner {
  Future<BuildResult> buildApk(
      String projectDir, SdkConfig sdk, ExportConfig config) async {
    // Mock build process
    await Future.delayed(const Duration(milliseconds: 100));
    return const BuildResult(
      success: true,
      outputPath: '/mock/out.apk',
      durationMs: 100,
    );
  }
}
