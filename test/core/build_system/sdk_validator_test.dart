import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/build_system/sdk/sdk_locator.dart';
import 'package:everengine/build_system/sdk/sdk_validator.dart';

void main() {
  group('SdkValidator', () {
    test('validate returns true for valid sdk', () async {
      final sdk = const SdkConfig(
          path: '', version: '', dartVersion: '', channel: '', isValid: true);
      final result = await SdkValidator.validate(sdk);
      expect(result.isCompatible, isTrue);
    });

    test('validate returns false for invalid sdk', () async {
      final sdk = const SdkConfig(
          path: '', version: '', dartVersion: '', channel: '', isValid: false);
      final result = await SdkValidator.validate(sdk);
      expect(result.isCompatible, isFalse);
    });
  });
}
