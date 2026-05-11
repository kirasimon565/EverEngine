import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/project_hub/project_hub_screen.dart';
import '../screens/editor/editor_screen.dart';
import '../screens/preview/live_preview_screen.dart';
import '../screens/export/export_wizard_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/settings/sdk_management/sdk_management_screen.dart';
import '../screens/asset_manager/asset_manager_screen.dart';
import '../screens/variable_manager/variable_manager_screen.dart';
import '../screens/character_editor/character_editor_screen.dart';

class AppRouter {
  static final router = _Router();
}

class _Router {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/': return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/hub': return MaterialPageRoute(builder: (_) => const ProjectHubScreen());
      case '/editor': return MaterialPageRoute(builder: (_) => const EditorScreen());
      case '/preview': return MaterialPageRoute(builder: (_) => const LivePreviewScreen());
      case '/export': return MaterialPageRoute(builder: (_) => const ExportWizardScreen());
      case '/settings': return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case '/settings/sdk': return MaterialPageRoute(builder: (_) => const SdkManagementScreen());
      case '/asset-manager': return MaterialPageRoute(builder: (_) => const AssetManagerScreen());
      case '/variable-manager': return MaterialPageRoute(builder: (_) => const VariableManagerScreen());
      case '/characters': return MaterialPageRoute(builder: (_) => const CharacterEditorScreen());
      default: return null;
    }
  }
}
