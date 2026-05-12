import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:everengine/ui/screens/project_hub/project_hub_screen.dart';

void main() {
  testWidgets('renders project hub empty state', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(
      child: MaterialApp(
        home: ProjectHubScreen(),
      ),
    ));

    expect(find.text('EverEngine'), findsOneWidget);
    expect(find.text('Create your first game'), findsOneWidget);
    expect(find.text('New Project'), findsOneWidget);
  });
}
