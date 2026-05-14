import 'package:flutter/material.dart' hide Rect;
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';

class ChoiceGroupNode extends Node {
  static const String typeString = 'ChoiceGroupNode';

  ChoiceGroupNode({
    required super.id,
    super.properties,
    super.childrenIds,
    super.parentId,
    super.triggers,
    super.metadata,
    super.bounds = const Rect(x: 0, y: 0, width: 300, height: 200),
    super.isLocked,
    super.isVisible,
  }) : super(
          type: typeString,
        );

  factory ChoiceGroupNode.fromJson(Map<String, dynamic> json) {
    return ChoiceGroupNode(
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
          : const Rect(x: 0, y: 0, width: 300, height: 200),
      isLocked: json['isLocked'] ?? false,
      isVisible: json['isVisible'] ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        const PropertyDefinition(
            name: 'layoutStyle',
            type: PropertyType.string,
            defaultValue: 'list',
            displayName: 'Layout Style'),
        const PropertyDefinition(
            name: 'allowMultiple',
            type: PropertyType.boolean,
            defaultValue: false,
            displayName: 'Allow Multiple'),
        const PropertyDefinition(
            name: 'timerSeconds',
            type: PropertyType.integer,
            defaultValue: 0,
            displayName: 'Timer (s)'),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    return Container(
      color: Colors.blueGrey[800],
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                color: Colors.white24, borderRadius: BorderRadius.circular(8)),
            child: const Center(
                child: Text("Choice A", style: TextStyle(color: Colors.white))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.white24, borderRadius: BorderRadius.circular(8)),
            child: const Center(
                child: Text("Choice B", style: TextStyle(color: Colors.white))),
          ),
        ],
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
    return ChoiceGroupNode(
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
