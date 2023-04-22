import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebha/app/presentation/settings/controllers/counter_style_screen_controller.dart';
import 'package:sebha/app/widgets/build_text.dart';
import 'package:sebha/app/widgets/default_app_bar.dart';
import 'package:sebha/app/widgets/space.dart';
import 'package:sebha/core/application_managers/controllers_manager.dart';
import 'package:sebha/core/constants/global.dart';
import 'package:sebha/core/constants/locale_keys.dart';

class CountStylesScreen extends StatelessWidget {
  const CountStylesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DefaultAppBar(title: LocaleKeys.counterStyle),
        body: _CounterStyleBody());
  }
}

class _CounterStyleBody extends StatelessWidget {
  final CounterStyleScreenController _controller;

  _CounterStyleBody({Key? key})
      : _controller = ControllersHelper.inject(CounterStyleScreenController()),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          itemCount: Global.styleLength,
          separatorBuilder: (_, index) => const Space.vertical(30.0),
          itemBuilder: (_, index) {
            return Obx(
              () {
                final fileNum = index + 1;
                final file = '${Global.countStylePrefix}$fileNum';
                bool selected = file == _controller.selected.value;

                return ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: selected
                          ? const BorderSide(color: Colors.amberAccent)
                          : BorderSide.none),
                  onTap: () {
                    _controller.setSelectedStyle = file;
                  },
                  contentPadding: const EdgeInsets.all(5.0),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BuildText(data: LocaleKeys.buttonTheme),
                      BuildText(data: '$fileNum'),
                    ],
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/images/$file.png'),
                  ),
                );
              },
            );
          }),
    );
  }
}
