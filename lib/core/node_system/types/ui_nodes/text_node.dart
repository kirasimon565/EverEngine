import 'package:flutter/widgets.dart';
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';
import '../../../utils/color_utils.dart';

class TextNode extends Node {
  static const String typeString = "TextNode";

  TextNode({
    required super.id,
    super.properties,
    super.childrenIds,
    super.parentId,
    super.triggers,
    super.metadata,
    super.bounds,
    super.isLocked,
    super.isVisible,
  }) : super(
          type: typeString,
        );

  factory TextNode.fromJson(Map<String, dynamic> json) {
    return TextNode(
      id: NodeId.fromString(json['id'] as String),
      properties: (json['properties'] as Map<String, dynamic>? ?? {}).map(
          (k, v) =>
              MapEntry(k, PropertyValue.fromJson(v as Map<String, dynamic>))),
      childrenIds: (json['childrenIds'] as List<dynamic>? ?? [])
          .map((e) => NodeId.fromString(e as String))
          .toList(),
      parentId: json['parentId'] != null
          ? NodeId.fromString(json['parentId'] as String)
          : null,
      triggers: (json['triggers'] as Map<String, dynamic>? ?? {}).map(
          (k, v) => MapEntry(k, Trigger.fromJson(v as Map<String, dynamic>))),
      metadata: (json['metadata'] as Map<String, dynamic>? ?? {})
          .map((k, v) => MapEntry(k, v as String)),
      bounds: json['bounds'] != null
          ? Rect.fromJson(json['bounds'] as Map<String, dynamic>)
          : const Rect(x: 0, y: 0, width: 100, height: 100),
      isLocked: json['isLocked'] as bool? ?? false,
      isVisible: json['isVisible'] as bool? ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        PropertyDefinition(
            name: 'content',
            type: PropertyType.string,
            displayName: 'Text Content',
            defaultValue: 'New Text'),
        PropertyDefinition(
            name: 'fontSize',
            type: PropertyType.double_,
            displayName: 'Font Size',
            defaultValue: 14.0),
        PropertyDefinition(
            name: 'color',
            type: PropertyType.color,
            displayName: 'Text Color',
            defaultValue: '#000000'),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    final content = properties['content']?.value as String? ?? 'New Text';
    final fontSize = properties['fontSize']?.value as double? ?? 14.0;
    final colorHex = properties['color']?.value as String? ?? '#000000';

    return Text(
      content,
      style: TextStyle(
        fontSize: fontSize,
        color: ColorUtils.fromHex(colorHex),
      ),
    );
  }

  @override
  Node copyWith({
    NodeId? id,
    Map<String, PropertyValue>? properties,
    List<NodeId>? childrenIds,
    NodeId? parentId,
    Map<String, Trigger>? triggers,
    Map<String, String>? metadata,
    Rect? bounds,
    bool? isLocked,
    bool? isVisible,
  }) {
    return TextNode(
      id: id ?? this.id,
      properties: properties ?? this.properties,
      childrenIds: childrenIds ?? this.childrenIds,
      parentId: parentId ?? this.parentId,
      triggers: triggers ?? this.triggers,
      metadata: metadata ?? this.metadata,
      bounds: bounds ?? this.bounds,
      isLocked: isLocked ?? this.isLocked,
      isVisible: isVisible ?? this.isVisible,
    );
  }

  @override
  bool canHaveChildren() => false;
}
