import 'dart:ui';

class Localization {
  static final Map<String, Locale?> languageCodeToLocale = {
    'tr': const Locale('tr'),
    'en': const Locale('en'),
  };
  static final Map<String, String?> languageNameToCode = {
    'Türkçe': 'tr',
    'English': 'en',
  };
}

