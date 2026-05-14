import 'package:flutter/widgets.dart';
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';

class ImageNode extends Node {
  static const String typeString = "ImageNode";

  ImageNode({
    required super.id,
    super.properties,
    super.childrenIds,
    super.parentId,
    super.triggers,
    super.metadata,
    super.bounds,
    super.isLocked,
    super.isVisible,
  }) : super(
          type: typeString,
        );

  factory ImageNode.fromJson(Map<String, dynamic> json) {
    return ImageNode(
      id: NodeId.fromString(json['id'] as String),
      properties: (json['properties'] as Map<String, dynamic>? ?? {}).map(
          (k, v) =>
              MapEntry(k, PropertyValue.fromJson(v as Map<String, dynamic>))),
      childrenIds: (json['childrenIds'] as List<dynamic>? ?? [])
          .map((e) => NodeId.fromString(e as String))
          .toList(),
      parentId: json['parentId'] != null
          ? NodeId.fromString(json['parentId'] as String)
          : null,
      triggers: (json['triggers'] as Map<String, dynamic>? ?? {}).map(
          (k, v) => MapEntry(k, Trigger.fromJson(v as Map<String, dynamic>))),
      metadata: (json['metadata'] as Map<String, dynamic>? ?? {})
          .map((k, v) => MapEntry(k, v as String)),
      bounds: json['bounds'] != null
          ? Rect.fromJson(json['bounds'] as Map<String, dynamic>)
          : const Rect(x: 0, y: 0, width: 100, height: 100),
      isLocked: json['isLocked'] as bool? ?? false,
      isVisible: json['isVisible'] as bool? ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        PropertyDefinition(
            name: 'source',
            type: PropertyType.image,
            displayName: 'Image Source',
            defaultValue: ''),
        PropertyDefinition(
            name: 'width',
            type: PropertyType.double_,
            displayName: 'Width',
            defaultValue: 100.0),
        PropertyDefinition(
            name: 'height',
            type: PropertyType.double_,
            displayName: 'Height',
            defaultValue: 100.0),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    // Basic placeholder for now. Would load from assets or file depending on 'source'
    final width = properties['width']?.value as double? ?? 100.0;
    final height = properties['height']?.value as double? ?? 100.0;

    return Container(
      width: width,
      height: height,
      color: const Color(0xFFE0E0E0),
      child: const Center(
          child: Icon(IconData(0xe333,
              fontFamily: 'MaterialIcons'))), // Icons.image fallback
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
    return ImageNode(
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

  @override
  bool canHaveChildren() => false;
}
