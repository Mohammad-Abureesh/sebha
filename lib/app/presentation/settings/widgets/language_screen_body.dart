import 'package:flutter/material.dart';
import 'package:sebha/app/widgets/build_text.dart';
import 'package:sebha/app/widgets/space.dart';
import 'package:sebha/core/application_managers/controllers_manager.dart';
import 'package:sebha/core/locale_settings/general_local_settings.dart';
import 'package:sebha/core/locale_settings/lang_enum.dart';

import '../controllers/language_screen_controller.dart';

class LanguageScreenBody extends StatelessWidget {
  final LanguageScreenController _controller;

  LanguageScreenBody({Key? key})
      : _controller = ControllersHelper.inject(LanguageScreenController()),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var keys = GeneralLocaleSettings.appLanguages;
    return ListView.separated(
      itemCount: keys.length,
      itemBuilder: (_, index) => _LanguageItem(
        value: keys[index],
        isSelected: _controller.current.value == keys[index].code,
        onSelect: _controller.onSelectLanguage,
      ),
      separatorBuilder: (_, index) => const Space.vertical(15.0),
    );
  }
}

class _LanguageItem extends StatelessWidget {
  final ELanguages value;
  final bool isSelected;
  final ValueChanged<ELanguages> onSelect;

  const _LanguageItem(
      {Key? key,
      required this.value,
      required this.isSelected,
      required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onSelect.call(value),
      title: Row(
        children: [
          Visibility(
              visible: isSelected,
              child: const Icon(Icons.check_circle, color: Colors.amberAccent)),
          BuildText(data: value.code, fontSize: 18.0)
        ],
      ),
    );
  }
}
