import 'dart:async';
import 'event_types.dart';

class EventBus {
  static final EventBus _instance = EventBus._internal();
  factory EventBus() => _instance;
  EventBus._internal();

  final _controller = StreamController<EngineEvent>.broadcast();

  void emit(EngineEvent event) {
    _controller.add(event);
  }

  Stream<T> on<T extends EngineEvent>() {
    return _controller.stream.where((event) => event is T).cast<T>();
  }

  void dispose() {
    _controller.close();
  }
}
