import 'package:flutter/material.dart';
import 'package:sebha/core/application_managers/local_storage_manager.dart';
import 'package:sebha/core/constants/global.dart';
import 'package:sebha/core/constants/local_storage_keys.dart';

class CounterButton extends StatelessWidget {
  final VoidCallback onIncrement;

  final String? icon;

  const CounterButton({Key? key, required this.onIncrement, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double size = 300.0;

    String file = icon ??
        LocalStorageManager.readString(LocalStorageKeys.countButtonStyle,
            defaultVal: Global.defaultCountButtonStyle);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: TextButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
          onPressed: onIncrement,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/$file.png', height: size, width: size),
            ],
          )),
    );
  }
}
