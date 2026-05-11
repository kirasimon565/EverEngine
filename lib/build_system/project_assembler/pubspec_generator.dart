import '../build_config.dart';

class PubspecGenerator {
  String generatePubspec(BuildConfig config) {
    return '''
name: app
dependencies:
  flutter:
    sdk: flutter
''';
  }
}
