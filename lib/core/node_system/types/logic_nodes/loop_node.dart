import 'package:flutter/material.dart' hide Rect;
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';

class LoopNode extends Node {
  static const String typeString = 'LoopNode';

  LoopNode({
    required super.id,
    super.properties,
    super.childrenIds,
    super.parentId,
    super.triggers,
    super.metadata,
    super.bounds = const Rect(x: 0, y: 0, width: 200, height: 100),
    super.isLocked,
    super.isVisible,
  }) : super(
          type: typeString,
        );

  factory LoopNode.fromJson(Map<String, dynamic> json) {
    return LoopNode(
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
          : const Rect(x: 0, y: 0, width: 200, height: 100),
      isLocked: json['isLocked'] ?? false,
      isVisible: json['isVisible'] ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        const PropertyDefinition(
            name: 'condition',
            type: PropertyType.string,
            defaultValue: '',
            displayName: 'Condition'),
        const PropertyDefinition(
            name: 'maxIterations',
            type: PropertyType.integer,
            defaultValue: 100,
            displayName: 'Max Iterations'),
        const PropertyDefinition(
            name: 'loopBodyNodeId',
            type: PropertyType.string,
            defaultValue: '',
            displayName: 'Loop Body ID'),
        const PropertyDefinition(
            name: 'endNodeId',
            type: PropertyType.string,
            defaultValue: '',
            displayName: 'End Node ID'),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepPurple[500],
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          "Loop While: \${properties['condition']?.value}",
          style: const TextStyle(color: Colors.white, fontSize: 12),
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
    return LoopNode(
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
