import 'dart:convert';
import 'dart:io';
import 'scene.dart';
import '../node_system/node_serializer.dart';

class SceneSerializer {
  static Map<String, dynamic> serialize(Scene scene) {
    return {
      'name': scene.name,
      'displayName': scene.displayName,
      'rootNode': NodeSerializer.serializeTree(scene.rootNode),
      'backgroundColor': scene.backgroundColor,
      'orientation': scene.orientation,
      'transitionIn': scene.transitionIn,
      'transitionOut': scene.transitionOut,
      'isStartScene': scene.isStartScene,
      'createdAt': scene.createdAt.toIso8601String(),
      'updatedAt': scene.updatedAt.toIso8601String(),
      'metadata': scene.metadata,
    };
  }

  static Scene deserialize(Map<String, dynamic> json) {
    return Scene(
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      rootNode: NodeSerializer.deserializeTree(
          json['rootNode'] as Map<String, dynamic>),
      backgroundColor: json['backgroundColor'] as String?,
      orientation: json['orientation'] as String? ?? 'portrait',
      transitionIn: json['transitionIn'] as String? ?? 'fade',
      transitionOut: json['transitionOut'] as String? ?? 'fade',
      isStartScene: json['isStartScene'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      metadata: (json['metadata'] as Map<String, dynamic>? ?? {}).map(
        (k, v) => MapEntry(k, v as String),
      ),
    );
  }

  static Future<void> saveToFile(Scene scene, String path) async {
    final file = File(path);
    final jsonString = jsonEncode(serialize(scene));
    await file.writeAsString(jsonString);
  }

  static Future<Scene> loadFromFile(String path) async {
    final file = File(path);
    final jsonString = await file.readAsString();
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return deserialize(jsonMap);
  }
}
