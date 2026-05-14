abstract class EngineEvent {
  final DateTime timestamp;
  final String? sourceNodeId;

  EngineEvent({this.sourceNodeId}) : timestamp = DateTime.now();

  Map<String, dynamic> toJson();
}

class NodeDisplayedEvent extends EngineEvent {
  NodeDisplayedEvent(String nodeId) : super(sourceNodeId: nodeId);
  @override
  Map<String, dynamic> toJson() =>
      {'type': 'NodeDisplayedEvent', 'nodeId': sourceNodeId};
}

class VariableChangedEvent extends EngineEvent {
  final String variableName;
  final dynamic oldValue;
  final dynamic newValue;

  VariableChangedEvent(this.variableName, this.oldValue, this.newValue,
      {super.sourceNodeId});

  @override
  Map<String, dynamic> toJson() => {
        'type': 'VariableChangedEvent',
        'variableName': variableName,
        'oldValue': oldValue,
        'newValue': newValue,
        'nodeId': sourceNodeId
      };
}
