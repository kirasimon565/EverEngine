import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/build_system/sdk/sdk_locator.dart';

void main() {
  group('SdkLocator', () {
    test('findFlutterSdk returns mock SDK', () async {
      final sdk = await SdkLocator.findFlutterSdk();
      expect(sdk, isNotNull);
      expect(sdk!.isValid, isTrue);
      expect(sdk.version, equals('3.43.0'));
    });
  });
}
