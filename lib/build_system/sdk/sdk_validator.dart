import 'sdk_locator.dart';

class SdkValidationResult {
  final bool isCompatible;
  final String message;

  const SdkValidationResult(this.isCompatible, this.message);
}

class SdkValidator {
  static Future<SdkValidationResult> validate(SdkConfig config) async {
    if (!config.isValid)
      return const SdkValidationResult(false, 'SDK is invalid');
    return const SdkValidationResult(true, 'SDK is compatible');
  }
}
