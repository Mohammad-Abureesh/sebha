import 'package:get/get.dart';
import 'package:sebha/core/application_managers/local_storage_manager.dart';
import 'package:sebha/core/constants/local_storage_keys.dart';

class DashboardScreenController extends GetxController {
  DashboardScreenController()
      : _counterState = _CounterState(),
        _lastCounterState = _LastCounterState();

  final _CounterState _counterState;
  final _LastCounterState _lastCounterState;

  @override
  void onInit() {
    _lastCounterState.readInitState();
    super.onInit();
  }

  RxInt get counter => _counterState.count;
  RxInt get lastCounter => _lastCounterState.count;

  Rxn<String> icon = Rxn();

  void onIncrement() {
    _counterState.increment();
  }

  void resetCounter() {
    _lastCounterState.saveToLocalStorage(counter.value);
    _counterState.resetCount();
  }

  set setIcon(String? value) {
    icon.value = value;
  }
}

class _Counter extends GetxController {
  RxInt count = 0.obs;

  void resetCount() {
    _updateState = 0;
  }

  set _updateState(int count) {
    this.count.value = count;
  }
}

class _LastCounterState extends _Counter {
  @override
  set _updateState(int count) {
    super._updateState = count;
    LocalStorageManager.writeData(LocalStorageKeys.lastCounter, count);
  }

  void readInitState() {
    count.value = LocalStorageManager.readInt(LocalStorageKeys.lastCounter,
        defaultValue: 0);
  }

  void saveToLocalStorage(int count) {
    _updateState = count;
  }
}

class _CounterState extends _Counter {
  void increment() {
    count.value += 1;
  }
}
