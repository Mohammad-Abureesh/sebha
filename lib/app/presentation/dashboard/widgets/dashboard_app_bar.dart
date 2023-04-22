import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebha/app/presentation/dashboard/controllers/dashboard_screen_controller.dart';
import 'package:sebha/core/application_managers/controllers_manager.dart';
import 'package:sebha/core/constants/locale_keys.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ControllersHelper.find<DashboardScreenController>();
    return AppBar(
      actions: [
        IconButton(
            onPressed: controller.resetCounter,
            tooltip: LocaleKeys.resetCounter.tr,
            icon: const Icon(Icons.restart_alt_rounded))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
