class SplashController {
  Future<String> getInitialRoute() async {
    // Basic mock implementation
    return '/hub';
  }

  Future<bool> checkFirstLaunch() async {
    return false;
  }
}
