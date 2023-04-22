import 'package:flutter/material.dart';
import 'package:sebha/app/presentation/dashboard/controllers/dashboard_screen_controller.dart';
import 'package:sebha/core/application_managers/controllers_manager.dart';

import '../widgets/dashboard_app_bar.dart';
import '../widgets/dashboard_body.dart';
import '../widgets/side_menu/build_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllersHelper.inject(DashboardScreenController());
    return Scaffold(
      drawer: const BuildDrawer(),
      appBar: const DashboardAppBar(),
      body: DashboardBody(),
    );
  }
}
