class MathUtils {
  static double clamp(double value, double min, double max) {
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }

  static double lerp(double a, double b, double t) {
    return a + (b - a) * t;
  }

  static double inverseLerp(double a, double b, double value) {
    if (a == b) return 0.0;
    return (value - a) / (b - a);
  }

  static double remap(double value, double fromMin, double fromMax, double toMin, double toMax) {
    final t = inverseLerp(fromMin, fromMax, value);
    return lerp(toMin, toMax, t);
  }
}
