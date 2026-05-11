import 'scene.dart';
import 'scene_serializer.dart';

class SceneManager {
  final List<Scene> openScenes = [];
  Scene? activeScene;

  Future<SceneManager> openScene(String filePath) async {
    final scene = await SceneSerializer.loadFromFile(filePath);
    if (!openScenes.any((s) => s.name == scene.name)) {
      openScenes.add(scene);
    }
    activeScene = scene;
    return this;
  }

  Future<SceneManager> closeScene(String name) async {
    openScenes.removeWhere((s) => s.name == name);
    if (activeScene?.name == name) {
      activeScene = openScenes.isNotEmpty ? openScenes.last : null;
    }
    return this;
  }

  SceneManager setActiveScene(String name) {
    activeScene = openScenes.firstWhere((s) => s.name == name);
    return this;
  }

  Future<void> saveScene(String name) async {
    // simplified, needs access to project directory
  }

  Future<void> saveAllScenes() async {
    for (final scene in openScenes) {
      await saveScene(scene.name);
    }
  }

  bool hasUnsavedChanges(String name) {
    return false; // simplified
  }

  List<String> get openSceneNames => openScenes.map((s) => s.name).toList();
}
