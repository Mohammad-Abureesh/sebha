import 'package:get_storage/get_storage.dart';

///Read and write into local storage
///read method for each data type you need
///op [read],[write],[remove]
class LocalStorageManager {
  static final _localStorage = GetStorage();

  static dynamic _read(String key) => _localStorage.read(key);

  ///[readDynamic] possibly be null
  static dynamic readDynamic(String key) => _read(key);

  static String readString(String key, {String defaultVal = ''}) =>
      readDynamic(key) ?? defaultVal;

  static int readInt(String key, {int defaultValue = 0}) =>
      _read(key) ?? defaultValue;

  static int readDouble(String key, {double defaultValue = 0}) =>
      _read(key) ?? defaultValue;

  static num readNum(String key, {num defaultValue = 0}) =>
      _read(key) ?? defaultValue;

  static bool readBool(String key, {bool defaultValue = false}) =>
      _read(key) ?? defaultValue;

  static void writeData(String key, dynamic value) =>
      _localStorage.write(key, value);

  static void remove(String key) => _localStorage.remove(key);

  static bool compare(String key, other, [def]) {
    return readDynamic(key) == (other ?? def);
  }
}
