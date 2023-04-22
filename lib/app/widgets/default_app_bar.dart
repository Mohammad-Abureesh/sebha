import 'package:flutter/material.dart';
import 'package:sebha/app/widgets/build_text.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const DefaultAppBar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: title == null ? null : BuildText(data: title!));
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
