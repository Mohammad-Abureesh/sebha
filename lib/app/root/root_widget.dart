import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebha/app/presentation/dashboard/screens/dashboard_screen.dart';
import 'package:sebha/core/locale_settings/general_local_settings.dart';
import 'package:sebha/core/uiStyle/theme/themes.dart';

class SebhaApp extends StatelessWidget {
  const SebhaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sebha',
        locale: GeneralLocaleSettings.currentLocale,
        fallbackLocale: GeneralLocaleSettings.fallbackLocale,
        translations: GeneralLocaleSettings.translation,
        themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme: Themes.light,
        darkTheme: Themes.dark,
        home: const DashboardScreen());
  }
}
