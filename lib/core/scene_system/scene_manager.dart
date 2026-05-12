import 'scene.dart';

class SceneManager {
  final List<Scene> openScenes = [];
  Scene? activeScene;

  Future<SceneManager> openScene(String filePath) async {
    // In a real implementation, this would load the scene from the file system
    return this;
  }

  Future<SceneManager> closeScene(String name) async {
    openScenes.removeWhere((s) => s.name == name);
    if (activeScene?.name == name) {
      activeScene = openScenes.isNotEmpty ? openScenes.first : null;
    }
    return this;
  }

  SceneManager setActiveScene(String name) {
    try {
      activeScene = openScenes.firstWhere((s) => s.name == name);
    } catch (e) {
      // Scene not found
    }
    return this;
  }

  Future<void> saveScene(String name) async {
    // Delegate to SceneSerializer
  }

  Future<void> saveAllScenes() async {
    for (final scene in openScenes) {
      await saveScene(scene.name);
    }
  }

  bool hasUnsavedChanges(String name) {
    return false; // Implement tracking of unsaved changes
  }

  List<String> get openSceneNames => openScenes.map((s) => s.name).toList();
}
