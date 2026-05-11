class BuildResult {
  final bool success;
  final String? outputPath;
  final String? errorMessage;
  final String? logs;
  final int durationMs;

  const BuildResult({
    required this.success,
    this.outputPath,
    this.errorMessage,
    this.logs,
    required this.durationMs,
  });
}
