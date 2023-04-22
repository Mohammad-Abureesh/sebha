import 'package:flutter/material.dart';
import 'package:sebha/app/root/root_widget.dart';

import 'core/application_managers/pre_launch_manager.dart';

void main() async {
  await PreLaunchManager.initialize();
  runApp(const SebhaApp());
}
