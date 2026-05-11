import 'package:flutter/material.dart' hide Rect;
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';
import '../../../utils/color_utils.dart';

class DividerNode extends Node {
  static const String typeString = 'DividerNode';

  DividerNode({
    required NodeId id,
    Map<String, PropertyValue> properties = const {},
    List<NodeId> childrenIds = const [],
    NodeId? parentId,
    Map<String, Trigger> triggers = const {},
    Map<String, String> metadata = const {},
    Rect bounds = const Rect(x: 0, y: 0, width: 200, height: 16),
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

  factory DividerNode.fromJson(Map<String, dynamic> json) {
    return DividerNode(
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
      bounds: json['bounds'] != null ? Rect.fromJson(json['bounds']) : const Rect(x: 0, y: 0, width: 200, height: 16),
      isLocked: json['isLocked'] ?? false,
      isVisible: json['isVisible'] ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        const PropertyDefinition(name: 'height', type: PropertyType.double_, defaultValue: 16.0, displayName: 'Height'),
        const PropertyDefinition(name: 'thickness', type: PropertyType.double_, defaultValue: 1.0, displayName: 'Thickness'),
        const PropertyDefinition(name: 'indent', type: PropertyType.double_, defaultValue: 0.0, displayName: 'Indent'),
        const PropertyDefinition(name: 'endIndent', type: PropertyType.double_, defaultValue: 0.0, displayName: 'End Indent'),
        const PropertyDefinition(name: 'color', type: PropertyType.color, defaultValue: '#BDBDBD', displayName: 'Color'),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    final height = properties['height']?.value as double? ?? 16.0;
    final thickness = properties['thickness']?.value as double? ?? 1.0;
    final indent = properties['indent']?.value as double? ?? 0.0;
    final endIndent = properties['endIndent']?.value as double? ?? 0.0;
    final colorHex = properties['color']?.value as String? ?? '#BDBDBD';

    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: ColorUtils.fromHex(colorHex),
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
    return DividerNode(
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
