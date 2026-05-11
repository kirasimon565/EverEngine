import '../utils/id_generator.dart';

class NodeId {
  final String id;

  const NodeId()
      : id =
            '00000000-0000-0000-0000-000000000000'; // Default, should not be used typically without generate
  NodeId.generate() : id = IdGenerator.generate();
  const NodeId.fromString(this.id);

  static const NodeId zero =
      NodeId.fromString('00000000-0000-0000-0000-000000000000');

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NodeId && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => id;
}
