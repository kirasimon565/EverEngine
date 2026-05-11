import 'package:flutter/material.dart' hide Rect;
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';

class GridViewNode extends Node {
  static const String typeString = 'GridViewNode';

  GridViewNode({
    required NodeId id,
    Map<String, PropertyValue> properties = const {},
    List<NodeId> childrenIds = const [],
    NodeId? parentId,
    Map<String, Trigger> triggers = const {},
    Map<String, String> metadata = const {},
    Rect bounds = const Rect(x: 0, y: 0, width: 300, height: 400),
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

  factory GridViewNode.fromJson(Map<String, dynamic> json) {
    return GridViewNode(
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
      bounds: json['bounds'] != null ? Rect.fromJson(json['bounds']) : const Rect(x: 0, y: 0, width: 300, height: 400),
      isLocked: json['isLocked'] ?? false,
      isVisible: json['isVisible'] ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        const PropertyDefinition(name: 'crossAxisCount', type: PropertyType.integer, defaultValue: 2, displayName: 'Cross Axis Count'),
        const PropertyDefinition(name: 'crossAxisSpacing', type: PropertyType.double_, defaultValue: 8.0, displayName: 'Cross Axis Spacing'),
        const PropertyDefinition(name: 'mainAxisSpacing', type: PropertyType.double_, defaultValue: 8.0, displayName: 'Main Axis Spacing'),
        const PropertyDefinition(name: 'childAspectRatio', type: PropertyType.double_, defaultValue: 1.0, displayName: 'Child Aspect Ratio'),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    final crossAxisCount = properties['crossAxisCount']?.value as int? ?? 2;
    final crossAxisSpacing = properties['crossAxisSpacing']?.value as double? ?? 8.0;
    final mainAxisSpacing = properties['mainAxisSpacing']?.value as double? ?? 8.0;
    final childAspectRatio = properties['childAspectRatio']?.value as double? ?? 1.0;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.blue[(index % 9) * 100],
          child: Center(child: Text('Grid \$index')),
        );
      },
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
    return GridViewNode(
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
