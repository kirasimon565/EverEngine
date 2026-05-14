import '../utils/id_generator.dart';

class NodeId {
  final String id;

  const NodeId()
      : id =
            '00000000-0000-0000-0000-000000000000'; // Default, use generate for real IDs
  const NodeId._(this.id);

  factory NodeId.fromString(String id) {
    return NodeId._(id);
  }

  factory NodeId.generate() {
    return NodeId._(IdGenerator.generate());
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is NodeId && other.id == id);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => id;

  static const NodeId zero = NodeId._('00000000-0000-0000-0000-000000000000');
}
