import 'package:flutter/widgets.dart';
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';

class ColumnNode extends Node {
  static const String typeString = "ColumnNode";

  ColumnNode({
    required NodeId id,
    Map<String, PropertyValue> properties = const {},
    List<NodeId> childrenIds = const [],
    NodeId? parentId,
    Map<String, Trigger> triggers = const {},
    Map<String, String> metadata = const {},
    Rect bounds = const Rect(x: 0, y: 0, width: 100, height: 100),
    bool isLocked = false,
    bool isVisible = true,
  }) : super(
          id: id,
          type: typeString,
          properties: properties,
          childrenIds: childrenIds,
          parentId: parentId,
          triggers: triggers,
          metadata: metadata,
          bounds: bounds,
          isLocked: isLocked,
          isVisible: isVisible,
        );

  factory ColumnNode.fromJson(Map<String, dynamic> json) {
    return ColumnNode(
      id: NodeId.fromString(json['id'] as String),
      properties: (json['properties'] as Map<String, dynamic>? ?? {}).map(
          (k, v) => MapEntry(k, PropertyValue.fromJson(v as Map<String, dynamic>))),
      childrenIds: (json['childrenIds'] as List<dynamic>? ?? [])
          .map((e) => NodeId.fromString(e as String))
          .toList(),
      parentId: json['parentId'] != null ? NodeId.fromString(json['parentId'] as String) : null,
      triggers: (json['triggers'] as Map<String, dynamic>? ?? {}).map(
          (k, v) => MapEntry(k, Trigger.fromJson(v as Map<String, dynamic>))),
      metadata: (json['metadata'] as Map<String, dynamic>? ?? {}).map(
          (k, v) => MapEntry(k, v as String)),
      bounds: json['bounds'] != null ? Rect.fromJson(json['bounds'] as Map<String, dynamic>) : const Rect(x: 0, y: 0, width: 100, height: 100),
      isLocked: json['isLocked'] as bool? ?? false,
      isVisible: json['isVisible'] as bool? ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        PropertyDefinition(
          name: 'mainAxisAlignment',
          type: PropertyType.enum_,
          displayName: 'Main Axis Alignment',
          defaultValue: 'start',
          enumOptions: [
            EnumOption(value: 'start', label: 'Start'),
            EnumOption(value: 'end', label: 'End'),
            EnumOption(value: 'center', label: 'Center'),
          ]
        ),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    // In a real implementation, this would look up its children from a provider/registry
    // and render them inside the Column.
    return Column(
      children: const [Text('Column Placeholder')],
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
    return ColumnNode(
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
