import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/build_system/compiler/flutter_build_runner.dart';
import 'package:everengine/build_system/sdk/sdk_locator.dart';
import 'package:everengine/models/export_profile.dart';

void main() {
  group('FlutterBuildRunner', () {
    test('buildApk returns success', () async {
      final runner = FlutterBuildRunner();
      final sdk = const SdkConfig(
          path: '', version: '', dartVersion: '', channel: '', isValid: true);
      final config = const ExportConfig(appName: 'test', packageName: 'test');

      final result = await runner.buildApk('', sdk, config);
      expect(result.success, isTrue);
      expect(result.outputPath, equals('/mock/out.apk'));
    });
  });
}
