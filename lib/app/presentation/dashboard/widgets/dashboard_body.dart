import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sebha/app/presentation/dashboard/controllers/dashboard_screen_controller.dart';
import 'package:sebha/app/widgets/build_text.dart';
import 'package:sebha/app/widgets/space.dart';
import 'package:sebha/core/application_managers/controllers_manager.dart';
import 'package:sebha/core/constants/locale_keys.dart';

import 'counter_button.dart';
import 'options_dropdown.dart';

const double counterTextSize = 70.0;
const double lastCounterTextSize = 18.0;

class DashboardBody extends StatelessWidget {
  final DashboardScreenController _controller;

  DashboardBody({Key? key})
      : _controller = ControllersHelper.find<DashboardScreenController>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    var openOn = localizations.formatTimeOfDay(
        TimeOfDay.fromDateTime(DateTime.now()),
        alwaysUse24HourFormat: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Space.vertical(20.0),
            const OptionsDropdown(),
            const Space.vertical(10.0),
            BuildText(
                data: '${_controller.counter.value}',
                fontSize: counterTextSize,
                fontWeight: FontWeight.bold,
                translate: false),
            Expanded(
                child: Obx(() => CounterButton(
                    icon: _controller.icon.value,
                    onIncrement: _controller.onIncrement))),
            Row(
              children: [
                const BuildText(
                    data: LocaleKeys.lastCounter,
                    fontSize: lastCounterTextSize),
                const Space.horizontal(10.0),
                Obx(() {
                  return BuildText(
                      data: '${_controller.lastCounter.value}',
                      fontSize: lastCounterTextSize,
                      translate: false);
                }),
                const Spacer(),
                BuildText(
                    data: openOn,
                    translate: false,
                    fontWeight: FontWeight.bold),
              ],
            ),
          ],
        );
      }),
    );
  }
}
