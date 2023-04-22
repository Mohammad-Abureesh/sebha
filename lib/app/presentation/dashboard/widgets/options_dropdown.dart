import 'package:flutter/material.dart';
import 'package:sebha/app/widgets/build_text.dart';

const _items = <String>{
  'أستغفر اللّه',
  'سبحان اللّه',
  'الحمدللّه',
  'لا اله الا اللّه',
  'اللّه أكبر',
};

class OptionsDropdown extends StatefulWidget {
  const OptionsDropdown({Key? key}) : super(key: key);

  @override
  State<OptionsDropdown> createState() => _OptionsDropdownState();
}

class _OptionsDropdownState extends State<OptionsDropdown> {
  String option = _items.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.amberAccent)),
      child: DropdownButtonHideUnderline(
          child: DropdownButton(
              value: option,
              isExpanded: true,
              alignment: Alignment.center,
              items: _items
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BuildText(
                            data: e,
                            translate: false,
                          ),
                        ],
                      )))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  option = value;
                  setState(() {});
                }
              })),
    );
  }
}
