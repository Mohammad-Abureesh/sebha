import 'package:flutter/material.dart';

import 'lang_enum.dart';
import 'translate.dart';

class GeneralLocaleSettings {
  static bool isSysLang = false;
  static String defaultLang = ELanguages.arabic.code;
  static String _currentLang = defaultLang;

  static Locale get currentLocale => Locale(_currentLang);
  static Locale get fallbackLocale => Locale(defaultLang);

  static set updateCurrentLocale(String lang) => _currentLang = lang;

  static List<ELanguages> get appLanguages =>
      [ELanguages.english, ELanguages.arabic];

  static Translate get translation => Translate();
}
