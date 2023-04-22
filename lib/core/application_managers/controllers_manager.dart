/*
 *+----------------------------------------------------------------+
 *|                                                                |
 *|To manage all core.controllers for this application             |
 *|initialize static objects from applications core.controllers    |
 *|                                                                |
 *+----------------------------------------------------------------+
 */

import 'package:get/get.dart';

class ControllersManager {} //end ControllersManager

class ControllersHelper {
  static R inject<R>(R controller) => Get.put(controller);
  static R find<R>({String? tag}) => Get.find<R>(tag: tag);

  static R? findOrNull<R>({String? tag}) {
    if (!Get.isRegistered<R>()) return null;
    return Get.find<R>(tag: tag);
  }
}
