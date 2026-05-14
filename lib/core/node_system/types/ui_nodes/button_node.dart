import 'package:flutter/material.dart';
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';
import '../../../utils/color_utils.dart';

class ButtonNode extends Node {
  static const String typeString = "ButtonNode";

  ButtonNode({
    required super.id,
    super.properties,
    super.childrenIds,
    super.parentId,
    super.triggers,
    super.metadata,
    super.bounds = const Rect(x: 0, y: 0, width: 100, height: 40),
    super.isLocked,
    super.isVisible,
  }) : super(
          type: typeString,
        );

  factory ButtonNode.fromJson(Map<String, dynamic> json) {
    return ButtonNode(
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
          : const Rect(x: 0, y: 0, width: 100, height: 40),
      isLocked: json['isLocked'] as bool? ?? false,
      isVisible: json['isVisible'] as bool? ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        PropertyDefinition(
            name: 'label',
            type: PropertyType.string,
            displayName: 'Label',
            defaultValue: 'Button'),
        PropertyDefinition(
            name: 'backgroundColor',
            type: PropertyType.color,
            displayName: 'Background Color',
            defaultValue: '#2196F3'),
        PropertyDefinition(
            name: 'textColor',
            type: PropertyType.color,
            displayName: 'Text Color',
            defaultValue: '#FFFFFF'),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    final label = properties['label']?.value as String? ?? 'Button';
    final bgColorHex =
        properties['backgroundColor']?.value as String? ?? '#2196F3';
    final textColorHex = properties['textColor']?.value as String? ?? '#FFFFFF';

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorUtils.fromHex(bgColorHex),
        foregroundColor: ColorUtils.fromHex(textColorHex),
      ),
      child: Text(label),
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
    return ButtonNode(
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
