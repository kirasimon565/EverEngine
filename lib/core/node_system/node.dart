import 'package:flutter/widgets.dart';
import 'node_id.dart';
import 'properties/property_types.dart';
import 'properties/property.dart';
import 'node_registry.dart';

class Rect {
  final double x;
  final double y;
  final double width;
  final double height;

  const Rect({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  Map<String, dynamic> toJson() => {
        'x': x,
        'y': y,
        'width': width,
        'height': height,
      };

  factory Rect.fromJson(Map<String, dynamic> json) => Rect(
        x: (json['x'] as num).toDouble(),
        y: (json['y'] as num).toDouble(),
        width: (json['width'] as num).toDouble(),
        height: (json['height'] as num).toDouble(),
      );
}

class TriggerAction {
  final String actionType;
  final Map<String, dynamic> parameters;

  const TriggerAction({
    required this.actionType,
    this.parameters = const {},
  });

  Map<String, dynamic> toJson() => {
        'actionType': actionType,
        'parameters': parameters,
      };

  factory TriggerAction.fromJson(Map<String, dynamic> json) => TriggerAction(
        actionType: json['actionType'] as String,
        parameters: json['parameters'] as Map<String, dynamic>? ?? {},
      );
}

class Trigger {
  final String eventType;
  final List<TriggerAction> actions;
  final Map<String, dynamic>? conditions;

  const Trigger({
    required this.eventType,
    this.actions = const [],
    this.conditions,
  });

  Map<String, dynamic> toJson() => {
        'eventType': eventType,
        'actions': actions.map((a) => a.toJson()).toList(),
        'conditions': conditions,
      };

  factory Trigger.fromJson(Map<String, dynamic> json) => Trigger(
        eventType: json['eventType'] as String,
        actions: (json['actions'] as List?)
                ?.map((e) => TriggerAction.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        conditions: json['conditions'] as Map<String, dynamic>?,
      );
}

abstract class Node {
  final NodeId id;
  final String type;
  final Map<String, PropertyValue> properties;
  final List<NodeId> childrenIds;
  final NodeId? parentId;
  final Map<String, Trigger> triggers;
  final Map<String, String> metadata;
  final Rect bounds;
  final bool isLocked;
  final bool isVisible;

  const Node({
    required this.id,
    required this.type,
    this.properties = const {},
    this.childrenIds = const [],
    this.parentId,
    this.triggers = const {},
    this.metadata = const {},
    this.bounds = const Rect(x: 0, y: 0, width: 100, height: 100),
    this.isLocked = false,
    this.isVisible = true,
  });

  List<PropertyDefinition> get propertyDefinitions;

  Widget buildPreview(BuildContext context);

  Widget buildEditor(BuildContext context) {
    return buildPreview(context); // Default is to just render the preview
  }

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
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'type': type,
      'properties': properties.map((k, v) => MapEntry(k, v.toJson())),
      'childrenIds': childrenIds.map((e) => e.toString()).toList(),
      'parentId': parentId?.toString(),
      'triggers': triggers.map((k, v) => MapEntry(k, v.toJson())),
      'metadata': metadata,
      'bounds': bounds.toJson(),
      'isLocked': isLocked,
      'isVisible': isVisible,
    };
  }

  bool canHaveChildren() => true;

  int get maxChildren => -1;

  factory Node.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;
    return NodeRegistry.create(type, json);
  }
}
