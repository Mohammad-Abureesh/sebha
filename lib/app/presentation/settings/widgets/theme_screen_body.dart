import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebha/app/presentation/settings/controllers/theme_controller.dart';
import 'package:sebha/app/widgets/build_text.dart';
import 'package:sebha/app/widgets/space.dart';
import 'package:sebha/core/application_managers/controllers_manager.dart';
import 'package:sebha/core/constants/locale_keys.dart';

class ThemeScreenBody extends StatelessWidget {
  final ThemeController _controller;

  ThemeScreenBody({Key? key})
      : _controller = ControllersHelper.inject(ThemeController()),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var keys = [LocaleKeys.darkMode, LocaleKeys.lightMode];

    return ListView.separated(
      itemCount: keys.length,
      itemBuilder: (_, index) {
        final key = keys[index];
        return Obx(() {
          bool isDark = LocaleKeys.darkMode == key;
          bool darkMode = _controller.isDarkMode.value;

          return _ThemeItem(
              value: key,
              isDark: isDark,
              onSelect: _controller.onSelectTheme,
              isSelected: (darkMode && isDark) || (!darkMode && !isDark));
        });
      },
      separatorBuilder: (_, index) => const Space.vertical(15.0),
    );
  }
}

class _ThemeItem extends StatelessWidget {
  final String value;
  final bool isDark;
  final bool isSelected;
  final ValueChanged<String> onSelect;

  const _ThemeItem(
      {Key? key,
      required this.value,
      required this.onSelect,
      required this.isDark,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Icon icon = Icon(
      isDark ? Icons.dark_mode : Icons.light_mode,
      color: isSelected ? Colors.amberAccent : null,
    );

    return ListTile(
      onTap: () {
        onSelect.call(value);
      },
      leading: icon,
      title: BuildText(data: value, fontSize: 18.0),
    );
  }
}
