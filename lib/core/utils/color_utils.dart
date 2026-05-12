import 'dart:ui';

class ColorUtils {
  static Color fromHex(String hex) {
    String hexColor = hex.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor'));
    }
    return const Color(0xFF000000); // Default to black
  }

  static String toHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }

  static Color lerpColor(Color a, Color b, double t) {
    return Color.lerp(a, b, t) ?? a;
  }

  static double luminance(Color color) {
    return color.computeLuminance();
  }
}
