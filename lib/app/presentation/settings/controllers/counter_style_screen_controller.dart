import 'package:get/get.dart';
import 'package:sebha/app/presentation/dashboard/controllers/dashboard_screen_controller.dart';
import 'package:sebha/core/application_managers/controllers_manager.dart';
import 'package:sebha/core/application_managers/local_storage_manager.dart';
import 'package:sebha/core/constants/global.dart';
import 'package:sebha/core/constants/local_storage_keys.dart';

class CounterStyleScreenController extends GetxController {
  final _selectedKey = LocalStorageKeys.countButtonStyle;

  final RxString _selected = ''.obs;

  RxString get selected => _selected;

  @override
  void onInit() {
    _readSelectedFromStorage();
    super.onInit();
  }

  void _readSelectedFromStorage() {
    setSelectedStyle = LocalStorageManager.readString(_selectedKey,
        defaultVal: Global.defaultCountButtonStyle);
  }

  set setSelectedStyle(String style) {
    _selected.value = style;
    LocalStorageManager.writeData(_selectedKey, style);
    if (initialized) {
      ControllersHelper.findOrNull<DashboardScreenController>()?.setIcon =
          style;
    }
  }
}
