import 'package:flutter/material.dart' hide Rect;
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';
import '../../../utils/color_utils.dart';

class IconNode extends Node {
  static const String typeString = 'IconNode';

  IconNode({
    required NodeId id,
    Map<String, PropertyValue> properties = const {},
    List<NodeId> childrenIds = const [],
    NodeId? parentId,
    Map<String, Trigger> triggers = const {},
    Map<String, String> metadata = const {},
    Rect bounds = const Rect(x: 0, y: 0, width: 48, height: 48),
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

  factory IconNode.fromJson(Map<String, dynamic> json) {
    return IconNode(
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
      bounds: json['bounds'] != null ? Rect.fromJson(json['bounds']) : const Rect(x: 0, y: 0, width: 48, height: 48),
      isLocked: json['isLocked'] ?? false,
      isVisible: json['isVisible'] ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        const PropertyDefinition(name: 'iconName', type: PropertyType.string, defaultValue: 'star', displayName: 'Icon'),
        const PropertyDefinition(name: 'size', type: PropertyType.double_, defaultValue: 24.0, displayName: 'Size'),
        const PropertyDefinition(name: 'color', type: PropertyType.color, defaultValue: '#000000', displayName: 'Color'),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    final iconName = properties['iconName']?.value as String? ?? 'star';
    final size = properties['size']?.value as double? ?? 24.0;
    final colorHex = properties['color']?.value as String? ?? '#000000';

    // Simplistic mapping for demo purposes.
    IconData iconData = Icons.star;
    if (iconName == 'home') iconData = Icons.home;
    else if (iconName == 'settings') iconData = Icons.settings;

    return Icon(
      iconData,
      size: size,
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
    return IconNode(
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
