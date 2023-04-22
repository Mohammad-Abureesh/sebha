import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sebha/app/presentation/settings/controllers/theme_controller.dart';
import 'package:sebha/core/application_managers/controllers_manager.dart';
import 'package:sebha/core/locale_settings/app_language_controller.dart';

class PreLaunchManager {
  static final PreLaunchManager _manager = PreLaunchManager._();

  bool _mounted = false;

  PreLaunchManager._();

  static Future<void> initialize() async {
    await _manager._internalInitializer();
  }

  Future<void> _internalInitializer() async {
    if (_mounted) return;
    _mounted = true;
    await GetStorage.init();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]); //end

    ControllersHelper.inject(AppLanguageController());
    ControllersHelper.inject(ThemeController());
  }
}
