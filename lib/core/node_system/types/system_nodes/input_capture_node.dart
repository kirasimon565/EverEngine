import 'package:flutter/material.dart' hide Rect;
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';

class InputCaptureNode extends Node {
  static const String typeString = 'InputCaptureNode';

  InputCaptureNode({
    required super.id,
    super.properties,
    super.childrenIds,
    super.parentId,
    super.triggers,
    super.metadata,
    super.bounds = const Rect(x: 0, y: 0, width: 250, height: 80),
    super.isLocked,
    super.isVisible,
  }) : super(
          type: typeString,
        );

  factory InputCaptureNode.fromJson(Map<String, dynamic> json) {
    return InputCaptureNode(
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
          : const Rect(x: 0, y: 0, width: 250, height: 80),
      isLocked: json['isLocked'] ?? false,
      isVisible: json['isVisible'] ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        const PropertyDefinition(
            name: 'captureType',
            type: PropertyType.string,
            defaultValue: 'text',
            displayName: 'Type'),
        const PropertyDefinition(
            name: 'promptText',
            type: PropertyType.string,
            defaultValue: 'Enter text',
            displayName: 'Prompt'),
        const PropertyDefinition(
            name: 'variableToSet',
            type: PropertyType.string,
            defaultValue: '',
            displayName: 'Variable to Set'),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Expanded(
              child: TextField(
                  decoration: InputDecoration(hintText: "Input Capture"))),
          IconButton(icon: const Icon(Icons.send), onPressed: () {}),
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
    return InputCaptureNode(
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
