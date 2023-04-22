/*
 * this file include all dark theme data
 */

import 'package:flutter/material.dart';

import '../palette.dart';

class DarkTheme {
  ThemeData get theme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Palette.black,
        appBarTheme: AppBarTheme(
          color: Palette.black,
        ),
      );
}
