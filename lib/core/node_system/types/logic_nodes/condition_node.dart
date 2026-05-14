import 'package:flutter/material.dart' hide Rect;
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';

class ConditionNode extends Node {
  static const String typeString = 'ConditionNode';

  ConditionNode({
    required super.id,
    super.properties,
    super.childrenIds,
    super.parentId,
    super.triggers,
    super.metadata,
    super.bounds = const Rect(x: 0, y: 0, width: 150, height: 100),
    super.isLocked,
    super.isVisible,
  }) : super(
          type: typeString,
        );

  factory ConditionNode.fromJson(Map<String, dynamic> json) {
    return ConditionNode(
      id: NodeId.fromString(json['id']),
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, PropertyValue.fromJson(v)),
          ) ??
          {},
      childrenIds: (json['childrenIds'] as List?)
              ?.map((id) => NodeId.fromString(id))
              .toList() ??
          [],
      parentId:
          json['parentId'] != null ? NodeId.fromString(json['parentId']) : null,
      triggers: (json['triggers'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, Trigger.fromJson(v)),
          ) ??
          {},
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, v.toString()),
          ) ??
          {},
      bounds: json['bounds'] != null
          ? Rect.fromJson(json['bounds'])
          : const Rect(x: 0, y: 0, width: 150, height: 100),
      isLocked: json['isLocked'] ?? false,
      isVisible: json['isVisible'] ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        PropertyDefinition(
            name: 'conditionExpression',
            type: PropertyType.string,
            defaultValue: '',
            displayName: 'Condition'),
        PropertyDefinition(
            name: 'trueNodeId',
            type: PropertyType.string,
            defaultValue: '',
            displayName: 'True Node ID'),
        PropertyDefinition(
            name: 'falseNodeId',
            type: PropertyType.string,
            defaultValue: '',
            displayName: 'False Node ID'),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange[200],
        border: Border.all(color: Colors.orange, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          properties['conditionExpression']?.value as String? ?? 'Condition',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget buildEditor(BuildContext context) => buildPreview(context);

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
    return ConditionNode(
      id: id ?? this.id,
      properties: properties ?? Map.from(this.properties),
      childrenIds: childrenIds ?? List.from(this.childrenIds),
      parentId: parentId ?? this.parentId,
      triggers: triggers ?? Map.from(this.triggers),
      metadata: metadata ?? Map.from(this.metadata),
      bounds: bounds ?? this.bounds,
      isLocked: isLocked ?? this.isLocked,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
