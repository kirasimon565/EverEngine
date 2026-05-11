import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'everengine_app.dart';
import 'core/node_system/node_registry.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Register all nodes
  NodeRegistry.registerAll();

  runApp(
    const ProviderScope(
      child: EverEngineApp(),
    ),
  );
}
