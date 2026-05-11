import '../models/export_profile.dart';

class BuildConfig {
  final ExportConfig exportConfig;
  final String projectDir;
  final String tempDir;
  final bool hasCustomScripts;

  const BuildConfig({
    required this.exportConfig,
    required this.projectDir,
    required this.tempDir,
    required this.hasCustomScripts,
  });
}
