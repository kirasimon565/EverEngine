class AnalyticsService {
  Future<void> initialize() async {}

  void trackEvent(String name, [Map<String, dynamic>? params]) {}
  void trackScreen(String screenName) {}
  void trackError(String context, dynamic error, [StackTrace? stack]) {}
}

class CrashReportingService {
  Future<void> initialize() async {}
  void recordError(dynamic exception, [StackTrace? stack]) {}
  void log(String message) {}
}
