import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<void> ensureDirectory(String path) async {
    final dir = Directory(path);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
  }

  static Future<void> copyDirectory(String src, String dest) async {
    final srcDir = Directory(src);
    if (!await srcDir.exists()) return;

    await ensureDirectory(dest);

    await for (final entity in srcDir.list(recursive: false)) {
      final name = entity.uri.pathSegments.lastWhere((s) => s.isNotEmpty);
      final destPath = '$dest/$name';

      if (entity is Directory) {
        await copyDirectory(entity.path, destPath);
      } else if (entity is File) {
        await entity.copy(destPath);
      }
    }
  }

  static Future<void> deleteDirectory(String path) async {
    final dir = Directory(path);
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
  }

  static Future<int> directorySize(String path) async {
    final dir = Directory(path);
    if (!await dir.exists()) return 0;

    int size = 0;
    await for (final entity in dir.list(recursive: true)) {
      if (entity is File) {
        size += await entity.length();
      }
    }
    return size;
  }

  static Future<String> tempDirectory() async {
    final dir = await getTemporaryDirectory();
    return dir.path;
  }
}
