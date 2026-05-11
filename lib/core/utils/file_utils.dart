import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class FileUtils {
  static Future<void> ensureDirectory(String path) async {
    final dir = Directory(path);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
  }

  static Future<void> copyDirectory(String src, String dest) async {
    final srcDir = Directory(src);
    await ensureDirectory(dest);

    await for (final entity in srcDir.list(recursive: false)) {
      final newPath = p.join(dest, p.basename(entity.path));
      if (entity is Directory) {
        await copyDirectory(entity.path, newPath);
      } else if (entity is File) {
        await entity.copy(newPath);
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
    int totalSize = 0;
    final dir = Directory(path);
    if (await dir.exists()) {
      await for (final entity in dir.list(recursive: true)) {
        if (entity is File) {
          totalSize += await entity.length();
        }
      }
    }
    return totalSize;
  }

  static Future<String> tempDirectory() async {
    final dir = await getTemporaryDirectory();
    return dir.path;
  }
}
