import 'package:flutter/material.dart';
import 'package:sebha/app/widgets/build_text.dart';
import 'package:sebha/app/widgets/default_app_bar.dart';
import 'package:sebha/core/constants/locale_keys.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(title: LocaleKeys.privacyPolicy),
      body: Center(
        child: SingleChildScrollView(
            child: BuildText(
          data: '\n\nPrivacy Policy'
              'Free App \n No requirements or permission to use.\n No ADS.\n This app developed by MrDev ,Inc.',
          translate: false,
          fontSize: 18.0,
        )),
      ),
    );
  }
}
