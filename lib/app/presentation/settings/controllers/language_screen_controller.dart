import 'package:get/get.dart';
import 'package:sebha/core/application_managers/controllers_manager.dart';
import 'package:sebha/core/application_managers/local_storage_manager.dart';
import 'package:sebha/core/constants/local_storage_keys.dart';
import 'package:sebha/core/locale_settings/app_language_controller.dart';
import 'package:sebha/core/locale_settings/lang_enum.dart';

class LanguageScreenController extends GetxController {
  RxString current = ELanguages.arabic.code.obs;

  @override
  void onInit() {
    super.onInit();
    current.value = LocalStorageManager.readString(LocalStorageKeys.appLocale);
  }

  void onSelectLanguage(ELanguages key) {
    current.value = key.code;
    final ctr = ControllersHelper.inject(AppLanguageController());
    ctr.changeLanguage(key);
  }
}
