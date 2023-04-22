import 'package:flutter/material.dart';
import 'package:sebha/app/widgets/default_app_bar.dart';
import 'package:sebha/core/constants/locale_keys.dart';

import '../widgets/settings_screen_body.dart';

class SettingsDashboardScreen extends StatelessWidget {
  const SettingsDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DefaultAppBar(title: LocaleKeys.settings),
        body: SettingsScreenBody());
  }
}
