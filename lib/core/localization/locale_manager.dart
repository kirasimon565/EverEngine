import 'dart:ui';
import 'package:flutter/foundation.dart';

class LocaleManager {
  static final Map<String, Map<String, String>> _translations = {
    'en': {
      'app_name': 'EverEngine',
      'project_hub': 'Project Hub',
      'editor': 'Editor',
    }
  };

  static Locale _currentLocale = const Locale('en');

  static Future<void> initialize() async {}

  static String translate(String key, {Map<String, String>? args}) {
    final lang = _currentLocale.languageCode;
    String text = _translations[lang]?[key] ?? _translations['en']?[key] ?? key;

    if (args != null) {
      args.forEach((k, v) {
        text = text.replaceAll('{{$k}}', v);
      });
    }

    return text;
  }

  static void setLocale(Locale locale) {
    _currentLocale = locale;
  }

  static Locale get currentLocale => _currentLocale;
}
