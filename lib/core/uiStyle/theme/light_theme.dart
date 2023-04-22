/*
 * this file include all light theme data
 */

import 'package:flutter/material.dart';

import '../palette.dart';

class LightTheme {
  ThemeData get theme => ThemeData.light().copyWith(
        scaffoldBackgroundColor: Palette.white,
        appBarTheme: AppBarTheme(
          color: Palette.appbarBackground,
        ),
      );
}
