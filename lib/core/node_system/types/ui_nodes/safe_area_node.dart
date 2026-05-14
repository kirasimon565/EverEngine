import 'package:flutter/material.dart' hide Rect;
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';

class SafeAreaNode extends Node {
  static const String typeString = 'SafeAreaNode';

  SafeAreaNode({
    required super.id,
    super.properties,
    super.childrenIds,
    super.parentId,
    super.triggers,
    super.metadata,
    super.bounds = const Rect(x: 0, y: 0, width: 200, height: 200),
    super.isLocked,
    super.isVisible,
  }) : super(
          type: typeString,
        );

  factory SafeAreaNode.fromJson(Map<String, dynamic> json) {
    return SafeAreaNode(
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
          : const Rect(x: 0, y: 0, width: 200, height: 200),
      isLocked: json['isLocked'] ?? false,
      isVisible: json['isVisible'] ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        const PropertyDefinition(
            name: 'left',
            type: PropertyType.boolean,
            defaultValue: true,
            displayName: 'Safe Left'),
        const PropertyDefinition(
            name: 'top',
            type: PropertyType.boolean,
            defaultValue: true,
            displayName: 'Safe Top'),
        const PropertyDefinition(
            name: 'right',
            type: PropertyType.boolean,
            defaultValue: true,
            displayName: 'Safe Right'),
        const PropertyDefinition(
            name: 'bottom',
            type: PropertyType.boolean,
            defaultValue: true,
            displayName: 'Safe Bottom'),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    final safeLeft = properties['left']?.value as bool? ?? true;
    final safeTop = properties['top']?.value as bool? ?? true;
    final safeRight = properties['right']?.value as bool? ?? true;
    final safeBottom = properties['bottom']?.value as bool? ?? true;

    return SafeArea(
      left: safeLeft,
      top: safeTop,
      right: safeRight,
      bottom: safeBottom,
      child: Container(
        color: Colors.green.withOpacity(0.3),
        child: const Center(child: Text('Safe Area')),
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
    return SafeAreaNode(
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
