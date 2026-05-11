import 'package:flutter/material.dart' hide Rect;
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';

class AudioNode extends Node {
  static const String typeString = 'AudioNode';

  AudioNode({
    required NodeId id,
    Map<String, PropertyValue> properties = const {},
    List<NodeId> childrenIds = const [],
    NodeId? parentId,
    Map<String, Trigger> triggers = const {},
    Map<String, String> metadata = const {},
    Rect bounds = const Rect(x: 0, y: 0, width: 100, height: 60),
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

  factory AudioNode.fromJson(Map<String, dynamic> json) {
    return AudioNode(
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
          : const Rect(x: 0, y: 0, width: 100, height: 60),
      isLocked: json['isLocked'] ?? false,
      isVisible: json['isVisible'] ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        PropertyDefinition(
            name: 'source',
            type: PropertyType.string,
            defaultValue: '',
            displayName: 'Source'),
        PropertyDefinition(
            name: 'volume',
            type: PropertyType.double_,
            defaultValue: 1.0,
            displayName: 'Volume'),
        PropertyDefinition(
            name: 'loop',
            type: PropertyType.boolean,
            defaultValue: false,
            displayName: 'Loop'),
        PropertyDefinition(
            name: 'autoplay',
            type: PropertyType.boolean,
            defaultValue: true,
            displayName: 'Autoplay'),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(Icons.audiotrack),
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
    return AudioNode(
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
