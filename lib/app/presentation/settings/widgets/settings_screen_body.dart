import 'package:flutter/material.dart';
import 'package:sebha/app/presentation/settings/screens/language_screen.dart';
import 'package:sebha/app/presentation/settings/screens/theme_screen.dart';
import 'package:sebha/app/widgets/build_text.dart';
import 'package:sebha/core/application_managers/navigation_manager.dart';
import 'package:sebha/core/constants/locale_keys.dart';

const String _page = 'page';
const String _icon = 'icon';

class SettingsScreenBody extends StatelessWidget {
  final Map<String, Map<String, dynamic>> items = {
    LocaleKeys.theme: {
      _page: const ThemeScreen(),
      _icon: Icons.dark_mode,
    },
    LocaleKeys.language: {
      _page: const LanguageScreen(),
      _icon: Icons.language,
    },
  };

  SettingsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}
