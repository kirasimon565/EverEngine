import 'package:flutter/widgets.dart';
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';

class StackNode extends Node {
  static const String typeString = "StackNode";

  StackNode({
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

  factory StackNode.fromJson(Map<String, dynamic> json) {
    return StackNode(
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
            name: 'alignment',
            type: PropertyType.enum_,
            displayName: 'Alignment',
            defaultValue: 'topLeft',
            enumOptions: [
              EnumOption(value: 'topLeft', label: 'Top Left'),
              EnumOption(value: 'center', label: 'Center'),
            ]),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    return Stack(
      children: const [Text('Stack Placeholder')],
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
    return StackNode(
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
}
