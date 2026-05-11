import 'package:flutter/material.dart' hide Rect;
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';

class VariableCheckNode extends Node {
  static const String typeString = 'VariableCheckNode';

  VariableCheckNode({
    required NodeId id,
    Map<String, PropertyValue> properties = const {},
    List<NodeId> childrenIds = const [],
    NodeId? parentId,
    Map<String, Trigger> triggers = const {},
    Map<String, String> metadata = const {},
    Rect bounds = const Rect(x: 0, y: 0, width: 200, height: 100),
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

  factory VariableCheckNode.fromJson(Map<String, dynamic> json) {
    return VariableCheckNode(
      id: NodeId.fromString(json['id']),
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, PropertyValue.fromJson(v)),
          ) ?? {},
      childrenIds: (json['childrenIds'] as List?)?.map((id) => NodeId.fromString(id)).toList() ?? [],
      parentId: json['parentId'] != null ? NodeId.fromString(json['parentId']) : null,
      triggers: (json['triggers'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, Trigger.fromJson(v)),
          ) ?? {},
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, v.toString()),
          ) ?? {},
      bounds: json['bounds'] != null ? Rect.fromJson(json['bounds']) : const Rect(x: 0, y: 0, width: 200, height: 100),
      isLocked: json['isLocked'] ?? false,
      isVisible: json['isVisible'] ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        const PropertyDefinition(name: 'variableName', type: PropertyType.string, defaultValue: '', displayName: 'Variable Name'),
        const PropertyDefinition(name: 'operator', type: PropertyType.string, defaultValue: '==', displayName: 'Operator'),
        const PropertyDefinition(name: 'compareValue', type: PropertyType.string, defaultValue: '', displayName: 'Compare Value'),
        const PropertyDefinition(name: 'trueNodeId', type: PropertyType.string, defaultValue: '', displayName: 'True Node ID'),
        const PropertyDefinition(name: 'falseNodeId', type: PropertyType.string, defaultValue: '', displayName: 'False Node ID'),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.deepPurple[400], borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          "Check: \${properties['variableName']?.value} \${properties['operator']?.value} \${properties['compareValue']?.value}",
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
    return VariableCheckNode(
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
