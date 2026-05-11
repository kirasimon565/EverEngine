import 'dart:io';
import '../../models/keystore_profile.dart';

class ApkSigner {
  Future<File> signApk(File unsignedApk, KeystoreConfig? keystore) async {
    // Placeholder
    final out = File('\${unsignedApk.path}_signed.apk');
    await unsignedApk.copy(out.path);
    return out;
  }
}
