import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:everengine/ui/screens/editor/editor_screen.dart';

void main() {
  testWidgets('renders editor screen components', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: EditorScreen(),
        ),
      ),
    );

    expect(find.text('Project Name'), findsOneWidget);
  });
}
