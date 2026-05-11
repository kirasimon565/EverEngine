import '../build_config.dart';

class ManifestGenerator {
  String generateManifest(BuildConfig config) {
    final permissions = config.exportConfig.permissions
        .map((p) => '<uses-permission android:name="\$p" />')
        .join('\n    ');

    return '''
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="\${config.exportConfig.packageName}">
    \$permissions
    <application
        android:label="\${config.exportConfig.appName}"
        android:icon="@mipmap/ic_launcher">
    </application>
</manifest>
''';
  }
}
