import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  group('ContainerNode', () {
    test('ContainerNode has expected type string', () {
      final node = ContainerNode(id: NodeId.generate());
      expect(node.type, equals('ContainerNode'));
    });

    test('ContainerNode serializes all properties', () {
      final node = ContainerNode(id: NodeId.generate());
      final json = node.toJson();
      expect(json['type'], equals('ContainerNode'));
    });

    testWidgets('ContainerNode buildPreview returns a Container', (WidgetTester tester) async {
      final node = ContainerNode(id: NodeId.generate());
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Builder(builder: (context) {
          return node.buildPreview(context);
        }),
      ));
      expect(find.byType(Container), findsOneWidget);
    });

    test('canHaveChildren returns true', () {
      final node = ContainerNode(id: NodeId.generate());
      expect(node.canHaveChildren(), isTrue);
    });
  });
}
