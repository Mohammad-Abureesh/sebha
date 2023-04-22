import 'package:flutter/material.dart';
import 'package:sebha/app/widgets/default_app_bar.dart';
import 'package:sebha/core/constants/locale_keys.dart';

import '../widgets/about_app_body.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: DefaultAppBar(title: LocaleKeys.aboutApp),
        body: AboutAppBody());
  }
}
