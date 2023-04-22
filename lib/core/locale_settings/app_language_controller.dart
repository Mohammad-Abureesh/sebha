import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sebha/core/application_managers/local_storage_manager.dart';
import 'package:sebha/core/constants/local_storage_keys.dart';

import '/core/locale_settings/lang_enum.dart';
import 'general_local_settings.dart';

class AppLanguageController extends GetxController {
  String _appLocale = GeneralLocaleSettings.defaultLang;

  final String _appLocaleKey = LocalStorageKeys.appLocale;

  RxString currentLang = GeneralLocaleSettings.defaultLang.obs;

  RxString currentSourceLang = GeneralLocaleSettings.defaultLang.obs;

  @override
  void onInit() {
    super.onInit();
    initAppLang();
  }

  set _updateAppLocale(String key) => _appLocale = key;

  void initAppLang() async {
    _readSystemLanguage;
    _readLocaleFromLocalStorage();
    _callGetUpdateLocale();
  }

  void changeLanguage(ELanguages value) async {
    String key = value.code;

    _saveSystemLanguage(key == ELanguages.system.code);
    if (key == ELanguages.system.code) {
      var locale = Get.deviceLocale;
      String code = locale == null ? _appLocale : locale.languageCode;
      if (code == ELanguages.english.code || code == ELanguages.arabic.code) {
        key = code;
      }
    }

    //when try update same language
    if (_appLocale == key) return;

    _updateAppLocale = key;
    _callGetUpdateLocale();
  }

  void _callGetUpdateLocale() {
    _saveLocaleToLocaleStorage();
    GeneralLocaleSettings.updateCurrentLocale = _appLocale;
    currentLang.value = _appLocale;
    _readSystemLanguage;
    Get.updateLocale(Locale(_appLocale));
    update();
  }

  void _readLocaleFromLocalStorage() => _updateAppLocale =
      LocalStorageManager.readString(_appLocaleKey, defaultVal: _appLocale);
  void _saveLocaleToLocaleStorage() =>
      LocalStorageManager.writeData(_appLocaleKey, _appLocale);

  bool get _readSystemLanguage {
    var val = LocalStorageManager.readBool(LocalStorageKeys.systemLang);
    currentSourceLang.value = val ? ELanguages.system.code : currentLang.value;
    return val;
  }

  void _saveSystemLanguage(bool v) {
    LocalStorageManager.writeData(LocalStorageKeys.systemLang, v);
    _readSystemLanguage;
  }
} //end AppLanguageController
