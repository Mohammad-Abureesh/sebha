import 'package:flutter/material.dart';
import 'package:sebha/app/presentation/settings/screens/about_screen.dart';
import 'package:sebha/app/presentation/settings/screens/count_styles_screen.dart';
import 'package:sebha/app/presentation/settings/screens/settings_screen.dart';
import 'package:sebha/app/widgets/build_text.dart';
import 'package:sebha/app/widgets/space.dart';
import 'package:sebha/core/application_managers/navigation_manager.dart';
import 'package:sebha/core/constants/locale_keys.dart';
import 'package:sebha/generated/assets.dart';

//Items keys
const _page = 'page';
const _icon = 'icon';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
            children: [const _Header(), _DrawerItems(), const _CompanyName()]),
      ),
    );
  }
}

class _DrawerItems extends StatelessWidget {
  _DrawerItems({Key? key}) : super(key: key);

  final Map<String, Map<String, dynamic>> items = {
    LocaleKeys.counterStyle: {
      _page: const CountStylesScreen(),
      _icon: Icons.add_circle,
    },
    LocaleKeys.settings: {
      _page: const SettingsDashboardScreen(),
      _icon: Icons.settings_sharp,
    },
    LocaleKeys.aboutApp: {
      _page: const AboutAppScreen(),
      _icon: Icons.info,
    }
  };

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: items.entries.map((e) {
        return ListTile(
            onTap: () {
              final screen = e.value[_page];
              if (screen == null) return;
              NavigationManager.openScreen(screen);
            },
            title: BuildText(data: e.key),
            leading: Icon(e.value[_icon] ?? Icons.text_fields_sharp));
      }).toList(),
    ));
  }
}

class _CompanyName extends StatelessWidget {
  const _CompanyName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BuildText(
        data: 'MrDev ,Inc.', translate: false, color: Colors.grey);
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: const [
            CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage(Assets.imagesAppLogo)),
            Space.horizontal(10.0),
            BuildText(
                data: LocaleKeys.appName,
                fontSize: 25.0,
                fontWeight: FontWeight.bold)
          ],
        ));
  }
}
