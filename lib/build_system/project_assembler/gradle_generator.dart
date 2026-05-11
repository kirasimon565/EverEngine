import '../build_config.dart';

class GradleGenerator {
  String generateRootBuildGradle(BuildConfig config) {
    return '''// root build.gradle''';
  }

  String generateAppBuildGradle(BuildConfig config) {
    return '''// app build.gradle''';
  }

  String generateSettingsGradle(BuildConfig config) {
    return '''// settings.gradle''';
  }

  String generateGradleProperties(BuildConfig config) {
    return '''// gradle.properties''';
  }

  String generateProGuardRules(BuildConfig config) {
    return '''// proguard-rules.pro''';
  }
}
