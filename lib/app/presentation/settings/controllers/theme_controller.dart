import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebha/core/application_managers/local_storage_manager.dart';
import 'package:sebha/core/constants/local_storage_keys.dart';
import 'package:sebha/core/constants/locale_keys.dart';
import 'package:sebha/core/uiStyle/theme/dark_theme.dart';
import 'package:sebha/core/uiStyle/theme/light_theme.dart';

class ThemeController extends GetxController {
  final _key = LocalStorageKeys.themeMode;

  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    _initTheme();
    super.onInit();
  }

  void _initTheme() {
    _readInitMode();
    String key = isDarkMode.isTrue ? LocaleKeys.darkMode : LocaleKeys.lightMode;
    _updateThemeFromKey(key);
  }

  void _readInitMode() {
    bool val = LocalStorageManager.readBool(_key, defaultValue: false);
    isDarkMode.value = val;
  }

  ///key from locale keys
  void onSelectTheme(String key) {
    if (key == LocaleKeys.darkMode && isDarkMode.isTrue) return;
    if (key == LocaleKeys.lightMode && isDarkMode.isFalse) return;
    _updateThemeFromKey(key);
  }

  void _updateThemeFromKey(String key) {
    bool isDark = key == LocaleKeys.darkMode;
    final theme = isDark ? DarkTheme().theme : LightTheme().theme;
    final mode = isDark ? ThemeMode.dark : ThemeMode.light;
    Get.changeTheme(theme);
    Get.changeThemeMode(mode);
    LocalStorageManager.writeData(_key, isDark);
    _readInitMode();
    update();
  }
}
