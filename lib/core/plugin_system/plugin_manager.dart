import 'plugin_interface.dart';

class PluginManager {
  final List<EverEnginePlugin> _loadedPlugins = [];

  void loadPlugin(EverEnginePlugin plugin) {
    _loadedPlugins.add(plugin);
  }

  void unloadPlugin(String pluginId) {
    _loadedPlugins.removeWhere((p) => p.id == pluginId);
  }

  List<EverEnginePlugin> getLoadedPlugins() =>
      List.unmodifiable(_loadedPlugins);
}
