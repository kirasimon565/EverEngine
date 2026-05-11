import '../build_config.dart';

class MainDartGenerator {
  String generateMainDart(BuildConfig config, bool hasCustomScripts) {
    return '''
import 'package:flutter/material.dart';
void main() => runApp(Container());
''';
  }
}
