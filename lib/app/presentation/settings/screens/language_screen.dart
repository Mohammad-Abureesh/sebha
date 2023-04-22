import 'package:flutter/material.dart';
import 'package:sebha/app/presentation/settings/widgets/language_screen_body.dart';
import 'package:sebha/app/widgets/default_app_bar.dart';
import 'package:sebha/core/constants/locale_keys.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DefaultAppBar(title: LocaleKeys.language),
        body: LanguageScreenBody());
  }
}
