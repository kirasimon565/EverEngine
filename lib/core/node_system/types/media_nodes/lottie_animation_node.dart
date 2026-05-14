import 'package:flutter/material.dart' hide Rect;
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';

class LottieAnimationNode extends Node {
  static const String typeString = 'LottieAnimationNode';

  LottieAnimationNode({
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

  factory LottieAnimationNode.fromJson(Map<String, dynamic> json) {
    return LottieAnimationNode(
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
            name: 'source',
            type: PropertyType.string,
            defaultValue: '',
            displayName: 'Source'),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.purple[100], borderRadius: BorderRadius.circular(8)),
      child: const Center(
        child: Icon(Icons.animation, color: Colors.purple, size: 48),
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
    return LottieAnimationNode(
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
