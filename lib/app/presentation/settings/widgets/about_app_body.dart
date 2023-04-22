import 'package:flutter/material.dart';
import 'package:sebha/app/widgets/build_text.dart';
import 'package:sebha/core/constants/global.dart';
import 'package:sebha/core/constants/locale_keys.dart';

class AboutAppBody extends StatelessWidget {
  const AboutAppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [_AppInfo(), _DeveloperContact()],
      ),
    );
  }
}

class _DeveloperContact extends StatelessWidget {
  const _DeveloperContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Card(title: LocaleKeys.developerContact, children: [
      ListTile(
          leading: Icon(Icons.email_outlined),
          title: BuildText(
            data: Global.developerEmail,
            translate: false,
          ))
    ]);
  }
}

class _AppInfo extends StatelessWidget {
  const _AppInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Card(title: LocaleKeys.appInfo, children: [
      _DetailsText(title: LocaleKeys.version, value: '2.0.0'),
      _DetailsText(title: LocaleKeys.offeredBy, value: 'Mr Dev , Inc.'),
      _DetailsText(title: LocaleKeys.releasedOn, value: '9/8/2019'),
    ]);
  }
}

class _DetailsText extends StatelessWidget {
  final String title;
  final String value;
  const _DetailsText({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      BuildText(data: title, fontSize: 16.0),
      BuildText(data: value, fontSize: 18.0, fontWeight: FontWeight.bold),
    ]);
  }
}

class _Card extends StatelessWidget {
  final List<Widget> children;
  final String title;

  const _Card({Key? key, required this.children, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      BuildText(data: title, fontSize: 18.0),
      ...this.children
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: children),
      ),
    );
  }
}
