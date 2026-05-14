import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/types/ui_nodes/text_node.dart';
import 'package:everengine/core/node_system/properties/property_types.dart';

void main() {
  group('TextNode', () {
    test('TextNode has expected type string', () {
      final node = TextNode(id: NodeId.generate());
      expect(node.type, equals('TextNode'));
    });

    test('TextNode serializes content correctly', () {
      final node = TextNode(id: NodeId.generate(), properties: {
        'content':
            const PropertyValue(value: 'Hello', type: PropertyType.string)
      });
      final json = node.toJson();
      expect(json['properties']['content']['value'], equals('Hello'));
    });

    testWidgets('TextNode buildPreview returns a Text widget',
        (WidgetTester tester) async {
      final node = TextNode(id: NodeId.generate());
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Builder(builder: (context) {
          return node.buildPreview(context);
        }),
      ));
      expect(find.byType(Text), findsOneWidget);
    });

    test('canHaveChildren returns false', () {
      final node = TextNode(id: NodeId.generate());
      expect(node.canHaveChildren(), isFalse);
    });
  });
}
