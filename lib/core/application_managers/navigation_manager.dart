/*
 *
 * This file to routes between presentation using getX package
 * or open dialog and show snack bar.
 * all methods in this file is static method
 * each method has specific animation.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO in future , add own animation for each method
class NavigationManager {
  //To open new screen withe fade animation
  static void openScreen(Widget screen) {
    Get.to(screen, transition: Transition.fade);
  } //end openScreen

  //To close an screen or back to previous screen or close dialog
  static void back<R>({R? r}) {
    Get.back<R>(result: r);
  } //end back

  //To open an alert dialog
  static Future<R?> openDialog<R>(Widget dialog) {
    return Get.dialog<R>(
      dialog,
      transitionCurve: Curves.bounceInOut,
    );
  } //end openDialog

  //To show snack bar
  static void openSnackBar(GetSnackBar snackBar) {
    Get.showSnackbar(snackBar);
  } //end openSnackBar

  //To show bottom navigation sheet
  static void openBottomSheet(Widget bottomSheet) {
    Get.bottomSheet(bottomSheet);
  } //end openBottomSheet

  static void showSnackBarMsg(String msg, [int duration = 1200]) {
    openSnackBar(GetSnackBar(
      title: '',
      message: msg,
      duration: Duration(milliseconds: duration),
    ));
  } //end showSnackBarMsg
} //end NavigationServices
