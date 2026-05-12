import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:everengine/ui/screens/editor/editor_screen.dart';

void main() {
  testWidgets('renders editor screen components', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(
      child: MaterialApp(
        home: EditorScreen(),
      ),
    ));

    expect(find.text('Project Name'), findsOneWidget);
    // Node Palette is encapsulated inside another widget now in the actual component, looking for 'Node Palette Categories' text.
    expect(find.text('Node Palette Categories'), findsOneWidget);
    // Canvas is encapsulated.
    expect(find.text('Canvas Content Area'), findsOneWidget);
    expect(find.text('Inspector'), findsOneWidget);
    expect(find.text('Scene Tabs'), findsOneWidget);
  });
}
