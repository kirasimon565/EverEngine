import 'package:flutter/widgets.dart';
import '../../node.dart';
import '../../node_id.dart';
import '../../properties/property.dart';
import '../../properties/property_types.dart';
import '../../../utils/color_utils.dart';

class ContainerNode extends Node {
  static const String typeString = "ContainerNode";

  ContainerNode({
    required NodeId id,
    Map<String, PropertyValue> properties = const {},
    List<NodeId> childrenIds = const [],
    NodeId? parentId,
    Map<String, Trigger> triggers = const {},
    Map<String, String> metadata = const {},
    Rect bounds = const Rect(x: 0, y: 0, width: 100, height: 100),
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

  factory ContainerNode.fromJson(Map<String, dynamic> json) {
    return ContainerNode(
      id: NodeId.fromString(json['id'] as String),
      properties: (json['properties'] as Map<String, dynamic>? ?? {}).map(
          (k, v) => MapEntry(k, PropertyValue.fromJson(v as Map<String, dynamic>))),
      childrenIds: (json['childrenIds'] as List<dynamic>? ?? [])
          .map((e) => NodeId.fromString(e as String))
          .toList(),
      parentId: json['parentId'] != null ? NodeId.fromString(json['parentId'] as String) : null,
      triggers: (json['triggers'] as Map<String, dynamic>? ?? {}).map(
          (k, v) => MapEntry(k, Trigger.fromJson(v as Map<String, dynamic>))),
      metadata: (json['metadata'] as Map<String, dynamic>? ?? {}).map(
          (k, v) => MapEntry(k, v as String)),
      bounds: json['bounds'] != null ? Rect.fromJson(json['bounds'] as Map<String, dynamic>) : const Rect(x: 0, y: 0, width: 100, height: 100),
      isLocked: json['isLocked'] as bool? ?? false,
      isVisible: json['isVisible'] as bool? ?? true,
    );
  }

  @override
  List<PropertyDefinition> get propertyDefinitions => [
        PropertyDefinition(name: 'width', type: PropertyType.double_, displayName: 'Width', defaultValue: 100.0),
        PropertyDefinition(name: 'height', type: PropertyType.double_, displayName: 'Height', defaultValue: 100.0),
        PropertyDefinition(name: 'color', type: PropertyType.color, displayName: 'Color', defaultValue: '#FFFFFF'),
        PropertyDefinition(name: 'borderRadius', type: PropertyType.double_, displayName: 'Border Radius', defaultValue: 0.0),
      ];

  @override
  Widget buildPreview(BuildContext context) {
    final width = properties['width']?.value as double? ?? 100.0;
    final height = properties['height']?.value as double? ?? 100.0;
    final colorHex = properties['color']?.value as String? ?? '#FFFFFF';
    final borderRadius = properties['borderRadius']?.value as double? ?? 0.0;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ColorUtils.fromHex(colorHex),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
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
    return ContainerNode(
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
  bool canHaveChildren() => true;

  @override
  int get maxChildren => -1;
}
